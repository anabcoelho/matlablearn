function sinais = AbreSinalPEBx(Caminho)
%Abre_Sinal.m
%Seleciona e salva em disco segmentos de sinal
%

%referencia
%Maurï¿½cio Cagy - marï¿½o/1998
%ï¿½ltima revisï¿½o: 16/05/2006
%Alteraï¿½ï¿½o : Aluizio d'Affonsï¿½ca 25/11/2011
%Alteraï¿½ï¿½o : Aluizio d'Affonsï¿½ca 06/07/2013
%            Modifiï¿½ï¿½o para ler arquivos do ADS1299

%Arquiva o caminho (Path) que contï¿½m os dados
if nargin == 0
    Dialogo = true;
end

%diretorio padrï¿½o vazio
path_arq = [];

if (nargin == 1)
    [path_arq,arq_name,est_arq] = fileparts(Caminho);
    
    if isempty(arq_name) || isempty(est_arq),
        Dialogo = true;
        if isempty(est_arq) && ~isempty(arq_name),
            path_arq = [path_arq,'\',arq_name];
        end
    else
        Dialogo = false;
        NomeARQdig = Caminho;
    end
end
    
%abre dialogo para arquivo com diretorio padrï¿½o    
if Dialogo
    [Arq,PATH]=uigetfile('*.pebx','Selecione o arquivo',path_arq);
    if Arq==0,
        sinais = [];      %retorna vazio caso abertura seja cancelada
        return;
    end
    NomeARQdig=[PATH,Arq];
end

ARQ=fopen(NomeARQdig,'rb');

if ARQ<0,
    exibe('Nï¿½o foi possï¿½vel abrir este arquivo!','Erro!');
    error('Nï¿½o foi possï¿½vel abrir este arquivo!')
end;


sinais.Fs=[]; % Inicializa a freq. amost. com uma matriz vazia;
% Serve para permitir a inclusï¿½o de um valor "default" no diï¿½logo
% de freq. de amostragem, quando for possï¿½vel obtï¿½-lo do cabeï¿½alho do arquivo.

%Arquivos formato PEB:
% elseif tipo==4,
Bph=1; %Bytes por elemento do cabeï¿½alho
Bpa=4; %Bytes por amostra
preci='int32';
versao = '1.0';

%Lï¿½ o cabeï¿½alho:
%sinais.TipoDeExame=setstr(fread(ARQ,NChar,'uchar')');
%Nplacas=fread(ARQ,1,'uint8');
%sinais.Nplacas = Nplacas; %slava numero de placas na estrutura
NChar=fread(ARQ,1,'uint8');
sinais.VersaoPEBx = setstr(fread(ARQ,NChar,'uchar')');
if(strcmp(versao,sinais.VersaoPEBx) == 0)
   disp(['A versão do arquivo ' sinais.VersaoPEBx ' é diferente do esperado ' versao])
   return
end
NChar=fread(ARQ,1,'uint8');
sinais.VersaoFirmware = setstr(fread(ARQ,NChar,'uchar')');
sinais.Fs=fread(ARQ,1,'uint16');
%sinais.TipoTeste=fread(ARQ,1,'uint8');
%sinais.MVC = fread(ARQ,1,'float64');
%NChar=fread(ARQ,1,'uint8');
%sinais.TimeUnit=setstr(fread(ARQ,1,'uchar')');
Ncan_in=fread(ARQ,1,'uint8');
sinais.NumCanais = Ncan_in; %salva numero de cansi na estrutura
for i=1:Ncan_in,
    NChar=fread(ARQ,1,'uint8');
    sinais.NomeCanais{i}=setstr(fread(ARQ,NChar,'uchar')');
end;
%sinais.EquacaoConv=fread(ARQ,1,'float64');
sinais.EquacaoConv='(Sinal*4.5*Escala/((2^23)-1))+Offset)/Ganho';
sinais.Ganhos=fread(ARQ,Ncan_in,'float64');
sinais.Escalas=fread(ARQ,Ncan_in,'float64');
sinais.Offsets=fread(ARQ,Ncan_in,'float64');
%TemEstim=fread(ARQ,1,'uint8');
%sinais.Ncan_est = TemEstim;   %numero de canais de trigger
%Ncan_in=Ncan_in+TemEstim;
%sinais.cAng=[sinais.cAng;ones(TemEstim,1)];
%sinais.cLin=[sinais.cLin;zeros(TemEstim,1)];
%sinais.HighCutOff=fread(ARQ,Nplacas,'float64');
%sinais.LowCutOff=fread(ARQ,Nplacas,'float64');
sinais.AnoExame=fread(ARQ,1,'uint16');
sinais.MesExame=fread(ARQ,1,'uint8');
sinais.DiaExame=fread(ARQ,1,'uint8');
sinais.HoraExame=fread(ARQ,1,'uint8');
sinais.MinExame=fread(ARQ,1,'uint8');
sinais.SegExame=fread(ARQ,1,'uint8');
NChar=fread(ARQ,1,'uint8');
sinais.Comentarios=setstr(fread(ARQ,NChar,'uchar')');
tam_header=ftell(ARQ); %tamanho do cabeï¿½alho

Ncanais=Ncan_in;
fseek(ARQ,0,'eof');    %pula para o final do  arquivo
Tam_arq = (ftell(ARQ)-tam_header)/Bpa;   %tamanho do arquivo que contem as amostras
Numero_amostras=fix(Tam_arq/Ncanais); %Tamanho do sinal em numero de amostras intercaladas
Tam_arq = Numero_amostras*(Ncanais);   % corrige tamanho para corresponder a um numero inteiro de bytes
fseek(ARQ,tam_header,'bof'); %pula o cabeï¿½alho
[ARQdig,sr]=fread(ARQ,Tam_arq,preci);

ARQdig=reshape(ARQdig,Ncanais,Numero_amostras);   %monta matriz com canais nas linhas e amostras nas colunas
% % for k = 1:Ncanais,
% %     ARQdig(k,:) = (ARQdig(k,:) + sinais.cLin(k))*sinais.cAng(k);
% % end
%sinais.ARQdig = (ARQdig +sinais.cLin*ones(1,Numero_amostras)).*(sinais.cAng*ones(1,Numero_amostras));  %escalona os valores
sinais.Sinal = ARQdig;
sinais.NumAmostras = Numero_amostras;
sinais.Caminho = NomeARQdig;   %Caminho do arquivo escolhido
fclose(ARQ);