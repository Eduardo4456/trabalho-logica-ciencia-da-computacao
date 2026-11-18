:- set_prolog_flag(encoding, utf8).
:- use_module(library(lists)).
:- use_module(library(readutil)).

:- dynamic sintoma_informado/1.

sintoma(nao_liga,                   'O computador nao liga (sem luz, sem ventoinha)').
sintoma(liga_sem_video,             'O computador liga, mas a tela fica sem imagem').
sintoma(bipes_na_inicializacao,     'Ouve bipes ao ligar o computador').
sintoma(tela_azul,                  'Aparece tela azul de erro').
sintoma(reinicia_sozinho,           'O computador reinicia sozinho').
sintoma(desliga_sozinho,            'O computador desliga sozinho').
sintoma(lento,                      'O computador esta muito lento').
sintoma(travamentos,                'O computador trava com frequencia').
sintoma(superaquecimento,           'O gabinete/notebook esta muito quente').
sintoma(ventoinha_barulhenta,       'A ventoinha faz muito barulho').
sintoma(barulho_hd,                 'O HD faz estalos ou cliques').
sintoma(boot_nao_encontra_sistema,  'Aparece "sistema operacional nao encontrado" ao ligar').
sintoma(artefatos_na_tela,          'Aparecem riscos ou manchas coloridas na tela').
sintoma(programas_fecham,           'Programas fecham sozinhos').
sintoma(virus_suspeito,             'Aparecem propagandas ou programas estranhos').
sintoma(disco_cheio,                'O aviso de disco cheio / pouco espaco aparece').
sintoma(sem_internet,               'Sem acesso a internet').
sintoma(wifi_nao_conecta,           'O Wi-Fi nao conecta ou cai toda hora').
sintoma(sem_som,                    'Nao sai som do computador').
sintoma(teclado_mouse_nao_respondem,'Teclado ou mouse nao respondem').

% problema(Id, Descricao, Categoria, Componente, Gravidade)
% Categoria : hardware | software | rede
% Gravidade : alta | media | baixa

problema(fonte_defeituosa,      'Fonte de alimentacao defeituosa',          hardware, fonte,               alta).
problema(ram_defeituosa,        'Memoria RAM com defeito ou mal encaixada', hardware, ram,                 media).
problema(hd_defeituoso,         'HD com defeito ou setores danificados',    hardware, hd,                  alta).
problema(superaquecimento_cpu,  'Superaquecimento do processador',          hardware, cpu,                 alta).
problema(placa_video_defeituosa,'Placa de video com defeito',               hardware, placa_video,         media).
problema(malware,               'Infeccao por virus ou malware',            software, sistema_operacional, media).
problema(sistema_corrompido,    'Sistema operacional corrompido',           software, sistema_operacional, media).
problema(pouco_espaco_disco,    'Pouco espaco livre em disco',              software, armazenamento,       baixa).
problema(driver_audio,          'Driver de audio ausente ou com defeito',   software, audio,               baixa).
problema(problema_rede,         'Falha na conexao de rede',                 rede,     adaptador_rede,      media).
problema(periferico_defeituoso, 'Periferico (teclado/mouse) com defeito',   hardware, periferico,          baixa).

% indica(Problema, Sintoma)
% Relaciona cada problema aos sintomas que ele costuma causar.

indica(fonte_defeituosa, nao_liga).
indica(fonte_defeituosa, desliga_sozinho).
indica(fonte_defeituosa, reinicia_sozinho).

indica(ram_defeituosa, bipes_na_inicializacao).
indica(ram_defeituosa, tela_azul).
indica(ram_defeituosa, reinicia_sozinho).
indica(ram_defeituosa, travamentos).
indica(ram_defeituosa, liga_sem_video).

indica(hd_defeituoso, barulho_hd).
indica(hd_defeituoso, boot_nao_encontra_sistema).
indica(hd_defeituoso, lento).
indica(hd_defeituoso, travamentos).
indica(hd_defeituoso, tela_azul).

indica(superaquecimento_cpu, superaquecimento).
indica(superaquecimento_cpu, desliga_sozinho).
indica(superaquecimento_cpu, lento).
indica(superaquecimento_cpu, ventoinha_barulhenta).
indica(superaquecimento_cpu, travamentos).

indica(placa_video_defeituosa, artefatos_na_tela).
indica(placa_video_defeituosa, liga_sem_video).
indica(placa_video_defeituosa, travamentos).
indica(placa_video_defeituosa, bipes_na_inicializacao).

indica(malware, lento).
indica(malware, virus_suspeito).
indica(malware, programas_fecham).
indica(malware, travamentos).

indica(sistema_corrompido, tela_azul).
indica(sistema_corrompido, boot_nao_encontra_sistema).
indica(sistema_corrompido, programas_fecham).
indica(sistema_corrompido, reinicia_sozinho).

indica(pouco_espaco_disco, disco_cheio).
indica(pouco_espaco_disco, lento).
indica(pouco_espaco_disco, programas_fecham).

indica(driver_audio, sem_som).

indica(problema_rede, sem_internet).
indica(problema_rede, wifi_nao_conecta).

indica(periferico_defeituoso, teclado_mouse_nao_respondem).

% solucao(Problema, Texto)
% Sugestões de correção (um problema pode ter várias).

solucao(fonte_defeituosa, 'Teste em outra tomada e com outro cabo de energia').
solucao(fonte_defeituosa, 'Se possivel, teste com outra fonte compativel').
solucao(fonte_defeituosa, 'Nao abra a fonte: ela guarda carga e e perigosa').

solucao(ram_defeituosa, 'Retire e reencaixe os pentes de memoria').
solucao(ram_defeituosa, 'Limpe os contatos dourados com borracha macia').
solucao(ram_defeituosa, 'Teste um pente por vez ou rode o MemTest86').

solucao(hd_defeituoso, 'Faca backup IMEDIATO dos dados importantes').
solucao(hd_defeituoso, 'Verifique a saude do disco (SMART) com CrystalDiskInfo').
solucao(hd_defeituoso, 'Considere trocar por um SSD').

solucao(superaquecimento_cpu, 'Limpe a poeira do cooler e do dissipador').
solucao(superaquecimento_cpu, 'Troque a pasta termica do processador').
solucao(superaquecimento_cpu, 'Confira se as ventoinhas giram e melhore a ventilacao').

solucao(placa_video_defeituosa, 'Atualize ou reinstale o driver de video').
solucao(placa_video_defeituosa, 'Reencaixe a placa e confira os cabos de energia').
solucao(placa_video_defeituosa, 'Teste com outro monitor/cabo ou com outra placa').

solucao(malware, 'Execute uma varredura completa com antivirus').
solucao(malware, 'Desinstale programas suspeitos e extensoes do navegador').
solucao(malware, 'Se persistir, faca backup, formate e reinstale o sistema').

solucao(sistema_corrompido, 'No Windows, rode "sfc /scannow" e "DISM" no prompt de comando').
solucao(sistema_corrompido, 'Use a restauracao do sistema').
solucao(sistema_corrompido, 'Em ultimo caso, reinstale o sistema operacional').

solucao(pouco_espaco_disco, 'Apague arquivos temporarios (Limpeza de Disco)').
solucao(pouco_espaco_disco, 'Desinstale programas que nao usa mais').
solucao(pouco_espaco_disco, 'Mova arquivos grandes para HD externo ou nuvem').

solucao(driver_audio, 'Verifique o volume e o dispositivo de saida selecionado').
solucao(driver_audio, 'Atualize ou reinstale o driver de audio').
solucao(driver_audio, 'Teste outro fone ou caixa de som').

solucao(problema_rede, 'Reinicie o roteador e o computador').
solucao(problema_rede, 'Esqueca e reconecte a rede Wi-Fi').
solucao(problema_rede, 'Teste com cabo de rede e verifique o driver do adaptador').

solucao(periferico_defeituoso, 'Teste em outra porta USB').
solucao(periferico_defeituoso, 'Troque pilhas/bateria se for sem fio').
solucao(periferico_defeituoso, 'Teste o periferico em outro computador').

% componente_delicado(Componente)
% Componentes que não convém o usuário comum mexer sozinho.

componente_delicado(fonte).
componente_delicado(hd).