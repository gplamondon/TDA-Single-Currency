class RscButton
{
	access = 0;
	type = 1;
	text = "";
	colorText[] = {0.8784,0.8471,0.651,1};
	colorDisabled[] = {0.4,0.4,0.4,1};
	colorBackground[] = {1,0.537,0,0.5};
	colorBackgroundDisabled[] = {0.95,0.95,0.95,1};
	colorBackgroundActive[] = {1,0.537,0,1};
	colorFocused[] = {1,0.537,0,1};
	colorShadow[] = {0.023529,0,0.0313725,1};
	colorBorder[] = {0.023529,0,0.0313725,1};
	soundEnter[] = {"\ca\ui\data\sound\onover",0.09,1};
	soundPush[] = {"\ca\ui\data\sound\new1",0,0};
	soundClick[] = {"\ca\ui\data\sound\onclick",0.07,1};
	soundEscape[] = {"\ca\ui\data\sound\onescape",0.09,1};
	style = 2;
	x = 0;
	y = 0;
	w = 0.095589;
	h = 0.039216;
	shadow = 2;
	font = "Zeppelin32";
	sizeEx = 0.03921;
	offsetX = 0.003;
	offsetY = 0.003;
	offsetPressedX = 0.002;
	offsetPressedY = 0.002;
	borderSize = 0;
};
class DRN_DIALOG
{
	idd=-1;
	movingenable=true;
	class Controls
	{
		class mapCherno: RscPicture
		{
			idc = 1200;
			text = "custom\spawn_select\mapCherno.paa";
			x = 0.340983 * safezoneW + safezoneX;
			y = 0.23125 * safezoneH + safezoneY;
			w = 0.30876 * safezoneW;
			h = 0.531375 * safezoneH;
		};
		class btnPetr: RscButton
		{
			idc = 1600;
			text = "Petrovka";
			x = 0.432812 * safezoneW + safezoneX;
			y = 0.291667 * safezoneH + safezoneY;
			w = 0.0396875 * safezoneW;
			h = 0.0161 * safezoneH;
			action = "closeDialog 0;spawnSelect = 0;";
		};
		class btnGvoz: RscButton
		{
			idc = 1601;
			text = "Gvozdno";
			x = 0.498959 * safezoneW + safezoneX;
			y = 0.30463 * safezoneH + safezoneY;
			w = 0.038125 * safezoneW;
			h = 0.0161 * safezoneH;
			action = "closeDialog 0;spawnSelect = 1;";
		};
		class btnVybo: RscButton
		{
			idc = 1602;
			text = "Vybor";
			x = 0.407812 * safezoneW + safezoneX;
			y = 0.431482 * safezoneH + safezoneY;
			w = 0.0297916 * safezoneW;
			h = 0.0161 * safezoneH;
			action = "closeDialog 0;spawnSelect = 2;";
		};
		class btnGork: RscButton
		{
			idc = 1603;
			text = "Gorka";
			x = 0.517708 * safezoneW + safezoneX;
			y = 0.425926 * safezoneH + safezoneY;
			w = 0.0323959 * safezoneW;
			h = 0.0161 * safezoneH;
			action = "closeDialog 0;spawnSelect = 3;";
		};
		class btnBere: RscButton
		{
			idc = 1604;
			text = "Berezino";
			x = 0.566146 * safezoneW + safezoneX;
			y = 0.411111 * safezoneH + safezoneY;
			w = 0.0402084 * safezoneW;
			h = 0.0161 * safezoneH;
			action = "closeDialog 0;spawnSelect = 4;";
		};
		class btnVysh: RscButton
		{
			idc = 1605;
			text = "Vyshnoye";
			x = 0.457291 * safezoneW + safezoneX;
			y = 0.556482 * safezoneH + safezoneY;
			w = 0.0417708 * safezoneW;
			h = 0.0161 * safezoneH;
			action = "closeDialog 0;spawnSelect = 5;";
		};
		class btnZele: RscButton
		{
			idc = 1606;
			text = "Zelenogorsk";
			x = 0.379688 * safezoneW + safezoneX;
			y = 0.597222 * safezoneH + safezoneY;
			w = 0.0532291 * safezoneW;
			h = 0.0161 * safezoneH;
			action = "closeDialog 0;spawnSelect = 6;";
		};
		class btnSoln: RscButton
		{
			idc = 1607;
			text = "Solnichny";
			x = 0.580729 * safezoneW + safezoneX;
			y = 0.540741 * safezoneH + safezoneY;
			w = 0.0407292 * safezoneW;
			h = 0.0161 * safezoneH;
			action = "closeDialog 0;spawnSelect = 7;";
		};
		class btnKoma: RscButton
		{
			idc = 1608;
			text = "Komarovo";
			x = 0.388541 * safezoneW + safezoneX;
			y = 0.706482 * safezoneH + safezoneY;
			w = 0.0433333 * safezoneW;
			h = 0.0161 * safezoneH;
			action = "closeDialog 0;spawnSelect = 8;";
		};
		class btnCher: RscButton
		{
			idc = 1609;
			text = "Cherno";
			x = 0.466146 * safezoneW + safezoneX;
			y = 0.683334 * safezoneH + safezoneY;
			w = 0.0386459 * safezoneW;
			h = 0.0161 * safezoneH;
			action = "closeDialog 0;spawnSelect = 9;";
		};
		class btnElek: RscButton
		{
			idc = 1610;
			text = "Elektro";
			x = 0.526041 * safezoneW + safezoneX;
			y = 0.703704 * safezoneH + safezoneY;
			w = 0.0407293 * safezoneW;
			h = 0.0161 * safezoneH;
			action = "closeDialog 0;spawnSelect = 10;";
		};
		class btnKamy: RscButton
		{
			idc = 1611;
			text = "Kamyshovo";
			x = 0.557812 * safezoneW + safezoneX;
			y = 0.666667 * safezoneH + safezoneY;
			w = 0.0480209 * safezoneW;
			h = 0.0161 * safezoneH;
			action = "closeDialog 0;spawnSelect = 11;";
		};
		class btnKrut: RscButton
		{
			idc = 1612;
			text = "Krutov";
			x = 0.583333 * safezoneW + safezoneX;
			y = 0.623149 * safezoneH + safezoneY;
			w = 0.035 * safezoneW;
			h = 0.0161 * safezoneH;
			action = "closeDialog 0;spawnSelect = 12;";
		};
		class btnRand: RscButton
		{
			idc = 1613;
			text = "Random";
			x = 0.592188 * safezoneW + safezoneX;
			y = 0.230556 * safezoneH + safezoneY;
			w = 0.0422917 * safezoneW;
			h = 0.0188889 * safezoneH;
			action = "closeDialog 0;spawnSelect = 13;";
		};
		class lblMap: RscText
		{
			idc = 1000;
			text = "Select spawn point or click here to spawn randomly:";
			x = 0.350521 * safezoneW + safezoneX;
			y = 0.225001 * safezoneH + safezoneY;
			w = 0.239687 * safezoneW;
			h = 0.0290741 * safezoneH;
		};

	};
};
