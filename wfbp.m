function key = wfbp
 
fig = gcf;
current_char = []; 
 
waserr = 0;
try
    h=findall(fig,'Type','uimenu','Accelerator','C');   
    set(h,'Accelerator','');                            
    keydown = waitforbuttonpress;
    current_char = double(get(fig,'CurrentCharacter')); 
    if~isempty(current_char) && (keydown == 1)        
        if(current_char == 3)                          
            waserr = 1;                                
        end
    end
    
set(h,'Accelerator','C');                           
catch 
    waserr = 1;
end
drawnow;
if(waserr == 1)
set(h,'Accelerator','C');                         
    error(message('MATLAB:ginput:Interrupted'));
end
if nargout>0, key = keydown; end
 
end