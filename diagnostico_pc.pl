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