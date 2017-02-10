/**
 * YtTools
 * requires mootools version 1.1
 *
 * @version 1.0.12 (19.05.2007)
 * @author yootheme.com
 * @copyright Copyright (C) 2007 YOOtheme Ltd. & Co. KG. All rights reserved.
 */ 
var YtTools = {
		
	start: function() {
		
		/* Match height of div tags */
		YtTools.setDivHeight();

		/* Accordion menu */
		var accordionFx = new YtAccordionMenu('li.toggler', 'ul.accordion', { accordion: 'slide' });

		/* Main menu */
		var enterColor = '#c8c8c8';
		var leaveColor = '#f5f5f5';

		var enterOptions = { 'background-color': enterColor };
		var leaveOptions = { 'background-color': leaveColor };

		if (YtSettings.layout == 'right') {
			enterOptions = { 'background-color': enterColor };
			leaveOptions = { 'background-color': leaveColor };
		}
		
		var menuFx = new YtTabMenu('#menu li', 
			{ 'margin-top': 0 }, { 'margin-top': 10 },
			{ transition: Fx.Transitions.expoOut });

		var othermenuFx = new YtTabMenu('#othermenu .level1', 
			enterOptions, leaveOptions,	{ transition: Fx.Transitions.expoOut });

		/* Top panel */
		var toppanelFx = new YtSlidePanel($E('#toppanel'), $E('#toppanel-wrapper'),
			YtSettings.heightToppanel, { transition: Fx.Transitions.expoOut, duration: 500 });
		toppanelFx.addTriggerEvent('#toppanel-container .trigger');
		toppanelFx.addTriggerEvent('#toppanel .close');

		/* Style switcher */
		var switcherFx = new YtStyleSwitcher($ES('.wrapper'), { 
			widthDefault: YtSettings.widthDefault,
			widthThinPx: YtSettings.widthThinPx,
			widthWidePx: YtSettings.widthWidePx,
			widthFluidPx: YtSettings.widthFluidPx,
			afterSwitch: YtTools.setDivHeight,
			transition: Fx.Transitions.expoOut,
			duration: 500
		});		

		/* Lightbox */
		if (YtSettings.lightbox) {

			/* Lightbox behavior */
			YtBase.setupLightbox();		

			/* Lightbox/Slimbox */
			Lightbox.init();
		}

	},

	/* Include addons */
	include: function(library) {
		$ES('script').each(function(s, i){
			var src = s.getProperty('src');
			if (src && src.match(/yt_tools\.js(\?.*)?$/)) {
				var path = src.replace(/yt_tools\.js(\?.*)?$/,'') + 'addons/';
				document.write('<script language="javascript" src="' + path + library + '" type="text/javascript"></script>');		
			}
		});
	},

	/* Match height of div tags */
	setDivHeight: function() {
		YtBase.matchDivHeight('div.topbox div', 0, 40);
		YtBase.matchDivHeight('div.bottombox div', 0, 40);
		YtBase.matchDivHeight('div.maintopbox div', 0);
		YtBase.matchDivHeight('div.mainbottombox div', 0);
		YtBase.matchDivHeight('div.contenttopbox div', 0);
		YtBase.matchDivHeight('div.contentbottombox div', 0);
	}

};

/* Include addons */
YtTools.include('base.js');
YtTools.include('tabmenu.js');
YtTools.include('accordionmenu.js');
YtTools.include('slidepanel.js');
YtTools.include('styleswitcher.js');

/* Add functions on window load */
window.addEvent('load', YtTools.start);
