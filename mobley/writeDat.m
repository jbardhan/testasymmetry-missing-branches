function writeDat(fileID,dataStructure,solvents)
if isstruct(dataStructure)
    fnames = fieldnames(dataStructure);
    first = sprintf(fnames{1});

    if strcmp(first,'Solute_Name')
        solute = 1;
        solvent = 0;
    else
        solvent = 1;
        solute = 0;
    end

    fid = fopen(fileID,'w');
    fprintf(fid,'\\documentclass{amsart} \n');
    fprintf(fid,'\\usepackage{float} \n');
    fprintf(fid,'\\usepackage{caption} \n');
    fprintf(fid,'\\usepackage{longtable} \n');
    fprintf(fid,'\\addtolength{\\oddsidemargin}{-1.6in} \n');
    fprintf(fid,'\\addtolength{\\evensidemargin}{-1.6in} \n');
    fprintf(fid,'\\addtolength{\\topmargin}{-1in} \n');
    fprintf(fid,'\\begin{document} \n');
    fprintf(fid,'\\begin{center}\n');
    fprintf(fid,'\\captionof{table}{} \n');
    if solute
        fprintf(fid,'\\begin{tabular}{c|c|c} \n');
    elseif solvent
        fprintf(fid,'\\begin{tabular}{c|c|c|c|c|c|c|c} \n');
    end
    if solute
        fprintf(fid,'\\textbf{Solute Name}&\\textbf{RMS Error}&\\textbf{Mean Absolute Error} \\\\ \\hline\n');
    elseif solvent
        fprintf(fid,'\\textbf{Solvent Name}&\\textbf{Number of Solutes}&\\textbf{RMS Error}&\\textbf{Mean Absolute Error}&\\textbf{RMS$_{T}$}&\\textbf{Absolute$_{T}$}&\\textbf{RMS$_{C}$}&\\textbf{Absolute$_{C}$} \\\\ \\hline\n'); 
    end
    fprintf(fid,'\\hline \n');
    for i = 1:length(dataStructure)
        if strcmp(first,'Solvent')
            fprintf(fid,'\\textbf{%s}&%3.0f&%f&%f&%f&%f&%f&%f \\\\ \\hline \n',replace(string(dataStructure(i).Solvent),'_','\_'),dataStructure(i).Num_Solutes,round(dataStructure(i).RMS,2),round(dataStructure(i).Mean_Abs_error,2),round(dataStructure(i).RMS_Training,2),round(dataStructure(i).Mean_Abs_error_Training,2),round(dataStructure(i).RMS_Cons,2),round(dataStructure(i).Mean_Abs_error_Cons,2)); 
        else
            fprintf(fid,'\\textbf{%s}&%f&%f \\\\ \\hline \n',replace(string(dataStructure(i).Solute_Name),'_','\_'),round(dataStructure(i).RMS,2),round(dataStructure(i).Mean_Abs_error,2));
        end
    end
    fprintf(fid,'\\end{tabular} \n');
    fprintf(fid,'\\end{center} \n');
    fprintf(fid,'\\end{document} \n');
    fclose(fid);
elseif numel(size(dataStructure))==2
    fid = fopen(fileID,'w');
    fprintf(fid,'\\documentclass{amsart} \n');
    fprintf(fid,'\\usepackage{float} \n');
    fprintf(fid,'\\usepackage{caption} \n');
    fprintf(fid,'\\usepackage{longtable} \n');
    fprintf(fid,'\\addtolength{\\oddsidemargin}{-1.6in} \n');
    fprintf(fid,'\\addtolength{\\evensidemargin}{-1.6in} \n');
    fprintf(fid,'\\addtolength{\\topmargin}{-1in} \n');
    fprintf(fid,'\\begin{document} \n');
    fprintf(fid,'\\begin{center}\n');
    fprintf(fid,'\\captionof{table}{} \n');
    fprintf(fid,'\\begin{tabular}{l|l|l|l|l|l|l|l|l|l} \n');
    fprintf(fid,strcat('&',join(solvents,'&'),' \\\\ \\hline \n'));
    
    for i = 1:length(solvents)
        fprintf(fid,strcat(['\\textbf{',solvents{i},'}'],'&',join(string(round(dataStructure(i,:),2)),' &'),'\\\\ \\hline \n'));
    end
    
    fprintf(fid,'\\end{tabular} \n');
    fprintf(fid,'\\end{center} \n');
    fprintf(fid,'\\end{document} \n');
    fclose(fid);
elseif numel(size(dataStructure))==3
    dataSize = size(dataStructure);
    numDocs = dataSize(3);
    for j = 1:numDocs
        fname = sprintf(strcat(string(j),fileID));
        fid = fopen(fname,'w');
        fprintf(fid,'\\documentclass{amsart} \n');
        fprintf(fid,'\\usepackage{float} \n');
        fprintf(fid,'\\usepackage{caption} \n');
        fprintf(fid,'\\usepackage{longtable} \n');
        fprintf(fid,'\\addtolength{\\oddsidemargin}{-1.6in} \n');
        fprintf(fid,'\\addtolength{\\evensidemargin}{-1.6in} \n');
        fprintf(fid,'\\addtolength{\\topmargin}{-1in} \n');
        fprintf(fid,'\\begin{document} \n');
        fprintf(fid,'\\begin{center}\n');
        fprintf(fid,'\\captionof{table}{} \n');
        fprintf(fid,'\\begin{tabular}{l|l|l|l|l|l|l|l|l|l} \n');
        fprintf(fid,strcat('&',join(solvents,'&'),' \\\\ \\hline \n'));

        for i = 1:length(solvents)
            fprintf(fid,strcat(['\\textbf{',solvents{i},'}'],'&',join(string(round(dataStructure(i,:,j),2)),' &'),'\\\\ \\hline \n'));
        end

        fprintf(fid,'\\end{tabular} \n');
        fprintf(fid,'\\end{center} \n');
        fprintf(fid,'\\end{document} \n');
        fclose(fid);
    end
end