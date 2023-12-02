fig = figure;
fig ;
 bp1 = uicontrol(fig , 'style' , 'push' , 'position' , [400 100 80 30] , 'string' , 'histogramme' , 'callback' , 'histogramme')
 bp2 = uicontrol(fig , 'style' , 'push' , 'position' , [400 75 80 30] , 'string' , 'filtre median' , 'callback' , 'filtre_median')
 bp3 = uicontrol(fig , 'style' , 'push' , 'position' , [400 50 80 30] , 'string' , 'filtre moyen' , 'callback' , 'filtre_moyen')
 bp4 = uicontrol(fig , 'style' , 'push' , 'position' , [400 25 80 30] , 'string' , 'filtre gaussien' , 'callback' , 'Fgaussien')