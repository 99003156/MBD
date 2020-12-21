open_system(new_system('model_auto_script1'));
add_block('simulink/Commonly Used Blocks/Constant', 'model_auto_script1/Constant');
set_param('model_auto_script1/Constant','position',[140,80,180,120]);
add_block('simulink/Commonly Used Blocks/Integrator','model_auto_script1/Integrator');
set_param('model_auto_script1/Integrator','position',[220,80,260,120]);
add_line('model_auto_script1','Constant/1','Integrator/1');
add_block('simulink/Commonly Used Blocks/Gain','model_auto_script1/Gain');
set_param('model_auto_script1/Gain','position',[300,80,340,120]);
add_line('model_auto_script1','Integrator/1','Gain/1');
add_block('simulink/Commonly Used Blocks/Out1','model_auto_script1/Scope');
set_param('model_auto_script1/Scope','position',[380,80,420,120]);
add_line('model_auto_script1','Gain/1','Scope/1');

RootParameterNames = fieldnames(get_param(0,'ObjectParameters'));
load_system('model_auto_script1')
GlobalParameterValue = get_param(0,'CurrentSystem')
ModelParameterValue = get_param('model_auto_script1','ModelVersion')
BlockPaths = find_system('model_auto_script1','Type','Block')

set_param('model_auto_script1','Solver','ode15s','StopTime','90')