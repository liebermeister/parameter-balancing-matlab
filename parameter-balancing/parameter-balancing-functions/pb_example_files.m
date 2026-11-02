% [model_name, model_file, data_file, prior_file, config_file] = pb_example_files(test_example);

function [model_name, model_file, data_file, prior_file, config_file] = pb_example_files(test_example);

switch test_example,
  case 'pfk',
    model_name  = '';
    model_file  = [ pb_resourcedir '/models/pfk/pfk.xml'];
    data_file   = [ pb_resourcedir '/models/pfk/pfk_data.tsv']; 
  case 'teusink',
    model_name  = '';
    model_file  = [ pb_resourcedir '/models/teusink/teusink.xml'];
    data_file   = [ pb_resourcedir '/models/teusink/teusink_data.tsv'];    
  case 'hynne',
    model_name  = '';
    model_file  = [ pb_resourcedir '/models/hynne/hynne.xml'];
    data_file   = [ pb_resourcedir '/models/hynne/hynne_data.tsv'];    
  case 'hynne_inh',
    model_name  = '';
    model_file  = [ pb_resourcedir '/models/hynne/hynne_inh.xml'];
    data_file   = [ pb_resourcedir '/models/hynne/hynne_data.tsv'];    
  case 'jiang',
    model_name  = '';
    model_file  = [ pb_resourcedir '/models/jiang/jiang.xml'];
    data_file   = [ pb_resourcedir '/models/jiang/jiang_data.tsv'];
  case 'escherichia-coli_noor_2016',
    model_name  = 'E coli central metabolism Noor et al (2016)';
    model_file  = [ pb_resourcedir '/models/escherichia-coli_noor_2016/escherichia-coli_noor_2016.xml'];
    data_file   = [ pb_resourcedir '/models/escherichia-coli_noor_2016/escherichia-coli_noor_2016_data.tsv'];
  case 'escherichia-coli_noor_2016_glycolysis',
    model_name  = '';
    model_file  = [ pb_resourcedir '/models/escherichia-coli_noor_2016_glycolysis/escherichia-coli_noor_2016_glycolysis.xml'];
    data_file   = [ pb_resourcedir '/models/escherichia-coli_noor_2016/escherichia-coli_noor_2016_data.tsv'];
  case 'escherichia-coli_iCH360',
    model_name  = 'E coli core and biosynthetic metabolism, iCH360 model (Corrao et al)';
    model_file  = [ pb_resourcedir '/models/escherichia-coli_iCH360/escherichia-coli_iCH360.xml'];
    data_file   = [ pb_resourcedir '/models/escherichia-coli_iCH360/escherichia-coli_iCH360_data.tsv'];
  case 'escherichia-coli_wortel_2018',
    model_name  = 'E coli central carbon metabolism, Wortel et al (2018)';
    model_file  = [ pb_resourcedir '/models/escherichia-coli_wortel_2018/escherichia-coli_wortel_2018.xml'];
    data_file   = [ pb_resourcedir '/models/escherichia-coli_wortel_2018/escherichia-coli_wortel_2018_data.tsv'];
  otherwise,
    error(sprintf('Unknown example model "%s"', test_example));
end

prior_file  = mnt_prior_file;
config_file = [ pb_basedir '/parameter-balancing/config/pb_options.tsv'];
