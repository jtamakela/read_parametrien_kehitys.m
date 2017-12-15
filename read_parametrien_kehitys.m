clear all, close all, clc;

kansio = 'Saline';

eval(['cd ', kansio]);

d=dir;
isub = [d(:).isdir];
lista = d(isub);

lista=lista(~ismember({lista.name},{'.','..'}));



for i = 1:length(lista);
    
    nimet{i} = lista(i).name;
    
    eval(['cd ', nimet{i}])
    
    
    fid=fopen('parametrien_kehitys.txt', 'r'); 
    
    temp = textscan(fid, '%s');
    
    fclose(fid);
    
    nodes_alku=find(ismember(temp{1},'---'))+1;
    
    results{i} = temp{1}(nodes_alku(end-1):end);
    
    
    Em(i) = str2num(char(results{1,i}(4)));
    E0(i) = str2num(char(results{1,i}(7)));
    Efe(i) = str2num(char(results{1,i}(10)));
    k0(i) = str2num(char(results{1,i}(13)));
    M(i) = str2num(char(results{1,i}(16)));
    f(i) = str2num(char(results{1,i}(19)));
    
    
    cd ..
end

ALL = [Em; E0; Efe; k0; M; f;];



cd ..