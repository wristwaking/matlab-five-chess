function initialState = setupFcn(fig)
initialState.figureHandle = fig; 
initialState.uisuspendState = uisuspend(fig);
initialState.toolbar = findobj(allchild(fig),'flat','Type','uitoolbar');
if ~isempty(initialState.toolbar)
    initialState.ptButtons = [uigettool(initialState.toolbar,'Plottools.PlottoolsOff'), ...
        uigettool(initialState.toolbar,'Plottools.PlottoolsOn')];
    initialState.ptState = get (initialState.ptButtons,'Enable');
    set (initialState.ptButtons,'Enable','off');
end
oldwarnstate = warning('off', 'MATLAB:hg:Figure:Pointer');
set(fig,'Pointer','fullcrosshair');
warning(oldwarnstate);
set(fig,'WindowButtonMotionFcn',@(o,e) dummy());
initialState.fig_units = get(fig,'Units');
end
