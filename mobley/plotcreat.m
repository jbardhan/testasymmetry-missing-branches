clear all;clc;close all
addpath('export_fig/')
%Water
%%
trainingplot_flag=1;
mnsolplot_flag=0;
mobleyplot_flag=1;
ploton=0;

outlier_flag=0;

%%

if trainingplot_flag==1
    
    
    run_water_training=load('RunWater_training_thermo.mat');

    index_training=run_water_training.index;  % index of 298K =24.85C in the temp vector
    dg_ref_training=run_water_training.refE(index_training,:);   % expaerimental Delta_G of the training set in kcal/mol
    ds_ref_training=run_water_training.refS;  % expaerimentalDelta S of the training set in cal/mol/K
    cp_ref_training=run_water_training.refCP;  % expaerimentalDelta S of the training set in cal/mol/K
    dg_calc_training=run_water_training.calcE(index_training,:); % calculated Delta_G of the training set in kcal/mol
    ds_calc_training=run_water_training.calcS; % calculated S of the training set in cal/mol/K
    cp_calc_training=run_water_training.calcCP; % calculated S of the training set in cal/mol/K
    dg_rms_298_training=run_water_training.dg_rms_298;
    ds_rms_298_training=run_water_training.ds_rms_298;
    cp_rms_298_training=run_water_training.cp_rms_298;
    
    dgcorrcoef=corrcoef(dg_ref_training,dg_calc_training);
    dscorrcoef=corrcoef(ds_ref_training,ds_calc_training);
    cpcorrcoef=corrcoef(cp_ref_training,cp_calc_training);

    if outlier_flag==1

        dg_err_training=abs(dg_ref_training-dg_calc_training);
        ds_err_training=abs(ds_ref_training-ds_calc_training);
        cp_err_training=abs(cp_ref_training-cp_calc_training);

        dg_err_training=sort(dg_err_training);
        ds_err_training=sort(ds_err_training);
        cp_err_training=sort(cp_err_training);

        dg_err_training_outlier=dg_err_training(end-1:end);
        ds_err_training_outlier=ds_err_training(end-1:end);
        cp_err_training_outlier=cp_err_training(end-1:end);

    end
    
    if ploton

        min_axe=round(min(min(dg_ref_training),min(dg_calc_training)));
        max_axe=round(max(max(dg_ref_training),max(dg_calc_training)));

        figure
        p=plot(dg_ref_training,dg_calc_training,'r+','markers',15,'LineWidth',1);
        set(gca,'FontSize',15)
        xlabel('\Delta G_{expt}^{Water} (kcal/mol)');
        ylabel('\Delta G_{calc}^{Water} (kcal/mol)');
        axis([min_axe-2 max_axe+2 min_axe-2 max_axe+2]);
        diagline=refline(1,0);
        set(diagline,'LineWidth',2);
        set(diagline,'Color','k');
        leg=legend(['SLIC; Training set; RMS = ',num2str(dg_rms_298_training)],'location','southeast');
        leg.Location='southeast';
        leg.FontSize=15;
        filename = sprintf('Output/DeltaG-water-training_set.PDF');
        export_fig(filename,'-painters','-transparent');
        hold off

        min_axe=round(min(min(ds_ref_training),min(ds_calc_training)));
        max_axe=round(max(max(ds_ref_training),max(ds_calc_training)));

        figure
        p=plot(ds_ref_training,ds_calc_training,'r+','markers',15,'LineWidth',1);
        set(gca,'FontSize',15)
        xlabel('\Delta S_{expt}^{Water} (cal/mol\circK)');
        ylabel('\Delta S_{calc}^{Water} (cal/mol\circK)');
        axis([min_axe-2 max_axe+2 min_axe-2 max_axe+2]);
        diagline=refline(1,0);
        set(diagline,'LineWidth',2);
        set(diagline,'Color','k');
        leg=legend(['SLIC \DeltaS; training set; RMS = ',num2str(ds_rms_298_training)]);
        leg.Location='southeast';
        leg.FontSize=15;
        filename = sprintf('Output/DeltaS-water-training_set.PDF');
        export_fig(filename,'-painters','-transparent');
        hold off

        min_axe=round(min(min(cp_ref_training),min(cp_calc_training)));
        max_axe=round(max(max(cp_ref_training),max(cp_calc_training)));

        figure
        p=plot(cp_ref_training,cp_calc_training,'r+','markers',15,'LineWidth',1);
        set(gca,'FontSize',15)
        xlabel('Cp_{expt}^{Water} (cal/mol\circK)');
        ylabel('Cp_{calc}^{Water} (cal/mol\circK)');
        axis([min_axe-2 max_axe+2 min_axe-2 max_axe+2]);
        diagline=refline(1,0);
        set(diagline,'LineWidth',2);
        set(diagline,'Color','k');
        leg=legend(['SLIC Cp; training set; RMS = ',num2str(cp_rms_298_training)]);
        leg.Location='northwest';
        leg.FontSize=15;
        filename = sprintf('Output/Cp-water-training_set.PDF');
        export_fig(filename,'-painters','-transparent');
        hold off
        
    end
    
    
    writeDat('Trainingset_Thermo.tex',run_water_training);
end

%%
if mnsolplot_flag==1
    
    fid = fopen('mnsol/water.csv','r'); 
    Data = textscan(fid,'%s %f %f','delimiter',',');
    fclose(fid);
    mol_list = Data{1};
    dG_list = Data{2};
    
    run_water_Mobley=load('RunWater_mobley_thermo.mat');
    
    [m, index] = ismember(mol_list,run_water_Mobley.mol_list);

    index_mnsol=run_water_Mobley.index;
    dg_ref_mnsol=dG_list';
    dg_calc_slic_mnsol=run_water_Mobley.calcE(index_mnsol,index);
    ds_calc_slic_mnsol=run_water_Mobley.dsvec(index);
    dg_rms_slic_mnsol=rms(dg_calc_slic_mnsol-dg_ref_mnsol);
    
    
    min_axe=round(min([min(dg_ref_mnsol),min(dg_calc_slic_mnsol)]));
    max_axe=round(max([max(dg_ref_mnsol),max(dg_calc_slic_mnsol)]));
    
    figure
    p=plot(dg_ref_mnsol,dg_calc_slic_mnsol,'r+','markers',15,'LineWidth',1);
    set(gca,'FontSize',15)
    axis([min_axe-2 max_axe+2 min_axe-2 max_axe+2]);
    xlabel('\DeltaG_{expt}^{Water} (cal/mol\circK)');
    ylabel('\DeltaG_{calc}^{Water} (cal/mol\circK)');
    leg=legend( ['SLIC \DeltaG; MNSol database; RMS = ',num2str(dg_rms_slic_mnsol)]);
    leg.Location='northwest';
    leg.FontSize=15;
    diagline=refline(1,0);
    set(diagline,'LineWidth',2);
    set(diagline,'Color','k');
    filename = sprintf('Output/DeltaG-water-mnsol.PDF');
    export_fig(filename,'-painters','-transparent');   
    hold off

end

%%
if mobleyplot_flag==1
    
    run_water_Mobley=load('RunWater_mobley_thermo.mat');
    
    index_mobley=run_water_Mobley.index;
    dg_ref_mobley=run_water_Mobley.refE(index_mobley,:);
    dg_calc_slic_mobley=run_water_Mobley.calcE(index_mobley,:);
    ds_calc_slic_mobley=run_water_Mobley.dsvec;
    dg_calc_mobley=run_water_Mobley.calc_mobley;
    dg_rms_slic_mobley=run_water_Mobley.dg_rms_298;
    dg_rms_mobley=run_water_Mobley.dg_rms_298_MD;

    min_axe=round(min([min(dg_ref_mobley),min(dg_calc_slic_mobley),min(dg_calc_mobley)]));
    max_axe=round(max([max(dg_ref_mobley),max(dg_calc_slic_mobley),max(dg_calc_mobley)]));
    

    if ploton 

        figure
        p=plot(dg_ref_mobley,dg_calc_slic_mobley,'r+','markers',15,'LineWidth',1);
        set(gca,'FontSize',15)
        axis([min_axe-2 max_axe+2 min_axe-2 max_axe+2]);
        xlabel('\DeltaG_{expt}^{Water} (cal/mol\circK)');
        ylabel('\DeltaG_{calc}^{Water} (cal/mol\circK)');
        hold on
        q=plot(dg_ref_mobley,dg_calc_mobley,'bo','markers',4,'LineWidth',2);
        hold on
        leg=legend( ['SLIC \DeltaG; Mobley database; RMS = ',num2str(dg_rms_slic_mobley)],...
                    ['MD \DeltaG; Mobley database; RMS =',num2str(dg_rms_mobley)]);
        leg.Location='southeast';
        leg.FontSize=15;   
        diagline=refline(1,0);
        set(diagline,'LineWidth',2);
        set(diagline,'Color','k');
        filename = sprintf('Output/DeltaG-water-mobley.PDF');
        export_fig(filename,'-painters','-transparent');
        hold off
        
    end
    
    writeDat_Mobley('Mobley_Thermo.tex',run_water_Mobley);
end



% axis([min(dg_ref_training)-3 max(dg_ref_training)+3 min(dg_ref_training)-3 max(dg_ref_training)+3])
% hold on
%plot([min(dg_ref_training)-3, max(dg_ref_training)+3],[min(dg_ref_training)-3 ,max(dg_ref_training)+3],'k','linewidth',2)


