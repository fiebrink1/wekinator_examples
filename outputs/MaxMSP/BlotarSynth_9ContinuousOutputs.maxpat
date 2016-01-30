{
	"patcher" : 	{
		"fileversion" : 1,
		"appversion" : 		{
			"major" : 7,
			"minor" : 0,
			"revision" : 1,
			"architecture" : "x86",
			"modernui" : 1
		}
,
		"openrect" : [ 31.0, 44.0, 977.0, 659.0 ],
		"bglocked" : 0,
		"openinpresentation" : 0,
		"default_fontsize" : 12.0,
		"default_fontface" : 0,
		"default_fontname" : "Arial",
		"gridonopen" : 1,
		"gridsize" : [ 15.0, 15.0 ],
		"gridsnaponopen" : 1,
		"objectsnaponopen" : 1,
		"statusbarvisible" : 2,
		"toolbarvisible" : 1,
		"lefttoolbarpinned" : 0,
		"toptoolbarpinned" : 0,
		"righttoolbarpinned" : 0,
		"bottomtoolbarpinned" : 0,
		"toolbars_unpinned_last_save" : 0,
		"tallnewobj" : 0,
		"boxanimatetime" : 200,
		"enablehscroll" : 1,
		"enablevscroll" : 1,
		"devicewidth" : 0.0,
		"description" : "",
		"digest" : "",
		"tags" : "",
		"style" : "",
		"subpatcher_template" : "",
		"boxes" : [ 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-68",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 594.0, 394.0, 256.0, 17.0 ],
					"style" : "",
					"text" : "DON'T change this (this is a standard control message)"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-67",
					"linecount" : 2,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 538.0, 513.0, 256.0, 27.0 ],
					"style" : "",
					"text" : "Sends to port 6448 (change this if Wekinator is listening on a different port)"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-66",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 478.0, 99.0, 241.0, 17.0 ],
					"style" : "",
					"text" : "The output message name"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-6",
					"linecount" : 3,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 538.0, 465.0, 250.0, 37.0 ],
					"style" : "",
					"text" : "This part sends output value updates back to Wekinator, so that Wekinator always has values if they're changed within Max patch itself."
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-1",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 498.0, 72.0, 241.0, 17.0 ],
					"style" : "",
					"text" : "This part receives the 9 Wekinator outputs on port 12000"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-64",
					"linecount" : 2,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 677.0, 173.0, 138.0, 27.0 ],
					"presentation" : 1,
					"presentation_linecount" : 2,
					"presentation_rect" : [ 32.0, 198.0, 138.0, 27.0 ],
					"style" : "",
					"text" : "BLOTAR CONTROL PARAMETERS:"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-63",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 233.0, 308.0, 73.0, 17.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 40.0, 76.0, 73.0, 17.0 ],
					"style" : "",
					"text" : "volume"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-59",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 257.0, 488.0, 20.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 257.0, 488.0, 20.0, 20.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-62",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 256.0, 525.0, 65.0, 22.0 ],
					"style" : "",
					"text" : "metro 100"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-61",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 487.0, 183.0, 41.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 490.0, 158.0, 41.0, 22.0 ],
					"style" : "",
					"text" : "$1 50"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-60",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 365.0, 164.0, 41.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 370.0, 162.0, 41.0, 22.0 ],
					"style" : "",
					"text" : "$1 50"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-56",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 485.0, 203.0, 59.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 474.0, 187.0, 59.0, 22.0 ],
					"style" : "",
					"text" : "line 1. 80"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-55",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 347.0, 184.0, 59.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 335.0, 186.0, 59.0, 22.0 ],
					"style" : "",
					"text" : "line 1. 80"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-52",
					"maxclass" : "preset",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "preset", "int", "preset", "int" ],
					"patching_rect" : [ 34.0, 381.0, 46.0, 39.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 229.0, 118.0, 46.0, 39.0 ],
					"preset_data" : [ 						{
							"number" : 1,
							"data" : [ 6, "obj-40", "gain~", "list", 70, 10.0, 5, "obj-33", "kslider", "int", 62, 5, "obj-32", "flonum", "float", 5.0, 5, "obj-31", "flonum", "float", 0.06, 5, "obj-30", "flonum", "float", 293.664764, 5, "obj-28", "number", "int", 0, 5, "obj-21", "flonum", "float", 0.130001, 5, "obj-20", "flonum", "float", 917.702393, 5, "obj-19", "flonum", "float", 1.059998, 5, "obj-18", "flonum", "float", 0.31, 5, "obj-17", "flonum", "float", 0.78, 5, "obj-16", "flonum", "float", 0.0, 5, "obj-15", "flonum", "float", 0.17, 5, "obj-14", "flonum", "float", 0.49, 5, "obj-10", "toggle", "int", 0, 5, "obj-8", "flonum", "float", 1.0 ]
						}
, 						{
							"number" : 2,
							"data" : [ 6, "obj-40", "gain~", "list", 70, 10.0, 5, "obj-33", "kslider", "int", 65, 5, "obj-32", "flonum", "float", 0.0, 5, "obj-31", "flonum", "float", 0.0, 5, "obj-30", "flonum", "float", 349.228241, 5, "obj-28", "number", "int", 0, 5, "obj-21", "flonum", "float", 0.0, 5, "obj-20", "flonum", "float", 891.0, 5, "obj-19", "flonum", "float", 0.829999, 5, "obj-18", "flonum", "float", 0.55, 5, "obj-17", "flonum", "float", 0.22, 5, "obj-16", "flonum", "float", 2.0, 5, "obj-15", "flonum", "float", 0.95, 5, "obj-14", "flonum", "float", 0.63, 5, "obj-10", "toggle", "int", 0, 5, "obj-8", "flonum", "float", 1.0 ]
						}
, 						{
							"number" : 3,
							"data" : [ 6, "obj-40", "gain~", "list", 70, 10.0, 5, "obj-33", "kslider", "int", 72, 5, "obj-32", "flonum", "float", 8.0, 5, "obj-31", "flonum", "float", 0.1, 5, "obj-30", "flonum", "float", 300.0, 5, "obj-28", "number", "int", 0, 5, "obj-21", "flonum", "float", 0.0, 5, "obj-20", "flonum", "float", 1000.0, 5, "obj-19", "flonum", "float", 0.82, 5, "obj-18", "flonum", "float", 1.63, 5, "obj-17", "flonum", "float", 0.64, 5, "obj-16", "flonum", "float", 3.0, 5, "obj-15", "flonum", "float", 0.99, 5, "obj-14", "flonum", "float", 0.06, 5, "obj-10", "toggle", "int", 0, 5, "obj-8", "flonum", "float", 1.0 ]
						}
, 						{
							"number" : 4,
							"data" : [ 6, "obj-40", "gain~", "list", 70, 10.0, 5, "obj-33", "kslider", "int", 43, 5, "obj-32", "flonum", "float", 0.0, 5, "obj-31", "flonum", "float", 0.0, 5, "obj-30", "flonum", "float", 300.0, 5, "obj-28", "number", "int", 11, 5, "obj-21", "flonum", "float", 0.0, 5, "obj-20", "flonum", "float", 900.0, 5, "obj-19", "flonum", "float", 0.0, 5, "obj-18", "flonum", "float", 0.37, 5, "obj-17", "flonum", "float", 0.78, 5, "obj-16", "flonum", "float", 5.0, 5, "obj-15", "flonum", "float", 3.409999, 5, "obj-14", "flonum", "float", 0.0, 5, "obj-10", "toggle", "int", 0, 5, "obj-8", "flonum", "float", 1.0 ]
						}
, 						{
							"number" : 5,
							"data" : [ 6, "obj-40", "gain~", "list", 70, 10.0, 5, "obj-33", "kslider", "int", 84, 5, "obj-32", "flonum", "float", 0.0, 5, "obj-31", "flonum", "float", 0.0, 5, "obj-30", "flonum", "float", 1046.502319, 5, "obj-28", "number", "int", 0, 5, "obj-21", "flonum", "float", 0.0, 5, "obj-20", "flonum", "float", 3270.319824, 5, "obj-19", "flonum", "float", 0.0, 5, "obj-18", "flonum", "float", 1.63, 5, "obj-17", "flonum", "float", 0.64, 5, "obj-16", "flonum", "float", 3.0, 5, "obj-15", "flonum", "float", 2.0, 5, "obj-14", "flonum", "float", 0.0, 5, "obj-10", "toggle", "int", 1, 5, "obj-8", "flonum", "float", 0.0 ]
						}
, 						{
							"number" : 6,
							"data" : [ 6, "obj-40", "gain~", "list", 70, 10.0, 5, "obj-33", "kslider", "int", 43, 5, "obj-32", "flonum", "float", 5.0, 5, "obj-31", "flonum", "float", 47.0, 5, "obj-30", "flonum", "float", 97.998856, 5, "obj-28", "number", "int", 6, 5, "obj-21", "flonum", "float", 0.130001, 5, "obj-20", "flonum", "float", 42.0, 5, "obj-19", "flonum", "float", 1.53, 5, "obj-18", "flonum", "float", 0.059999, 5, "obj-17", "flonum", "float", 0.78, 5, "obj-16", "flonum", "float", 78.0, 5, "obj-15", "flonum", "float", 3.309998, 5, "obj-14", "flonum", "float", 109.0, 5, "obj-10", "toggle", "int", 0, 5, "obj-8", "flonum", "float", 0.02 ]
						}
, 						{
							"number" : 7,
							"data" : [ 5, "obj-33", "kslider", "int", 55, 5, "obj-32", "flonum", "float", 5.0, 5, "obj-31", "flonum", "float", 0.06, 5, "obj-30", "flonum", "float", 195.997711, 5, "obj-28", "number", "int", 6, 5, "obj-21", "flonum", "float", 0.130001, 5, "obj-20", "flonum", "float", 42.0, 5, "obj-19", "flonum", "float", 1.059998, 5, "obj-18", "flonum", "float", 0.31, 5, "obj-17", "flonum", "float", 0.78, 5, "obj-16", "flonum", "float", 9.0, 5, "obj-15", "flonum", "float", 3.309998, 5, "obj-14", "flonum", "float", 109.0, 5, "obj-10", "toggle", "int", 0, 5, "obj-8", "flonum", "float", 0.02 ]
						}
, 						{
							"number" : 8,
							"data" : [ 6, "obj-40", "gain~", "list", 70, 10.0, 5, "obj-33", "kslider", "int", 43, 5, "obj-32", "flonum", "float", 5.0, 5, "obj-31", "flonum", "float", 47.0, 5, "obj-30", "flonum", "float", 250.0, 5, "obj-28", "number", "int", 6, 5, "obj-21", "flonum", "float", 0.130001, 5, "obj-20", "flonum", "float", 800.0, 5, "obj-19", "flonum", "float", 1.53, 5, "obj-18", "flonum", "float", 0.059999, 5, "obj-17", "flonum", "float", 0.78, 5, "obj-16", "flonum", "float", 78.0, 5, "obj-15", "flonum", "float", 3.309998, 5, "obj-14", "flonum", "float", 109.0, 5, "obj-10", "toggle", "int", 0, 5, "obj-8", "flonum", "float", 0.02 ]
						}
, 						{
							"number" : 9,
							"data" : [ 5, "obj-33", "kslider", "int", 72, 5, "obj-32", "flonum", "float", 0.0, 5, "obj-31", "flonum", "float", 0.0, 5, "obj-30", "flonum", "float", 523.25116, 5, "obj-28", "number", "int", 0, 5, "obj-21", "flonum", "float", 0.0, 5, "obj-20", "flonum", "float", 1635.159912, 5, "obj-19", "flonum", "float", 0.829999, 5, "obj-18", "flonum", "float", 0.55, 5, "obj-17", "flonum", "float", 0.22, 5, "obj-16", "flonum", "float", 2.0, 5, "obj-15", "flonum", "float", 0.95, 5, "obj-14", "flonum", "float", 0.63, 5, "obj-10", "toggle", "int", 1, 5, "obj-8", "flonum", "float", 1.0 ]
						}
, 						{
							"number" : 10,
							"data" : [ 5, "obj-33", "kslider", "int", 84, 5, "obj-32", "flonum", "float", 0.0, 5, "obj-31", "flonum", "float", 0.0, 5, "obj-30", "flonum", "float", 1046.502319, 5, "obj-28", "number", "int", 0, 5, "obj-21", "flonum", "float", 0.0, 5, "obj-20", "flonum", "float", 3270.319824, 5, "obj-19", "flonum", "float", 0.0, 5, "obj-18", "flonum", "float", 1.63, 5, "obj-17", "flonum", "float", 0.64, 5, "obj-16", "flonum", "float", 3.0, 5, "obj-15", "flonum", "float", 2.0, 5, "obj-14", "flonum", "float", 0.0, 5, "obj-10", "toggle", "int", 1, 5, "obj-8", "flonum", "float", 0.0 ]
						}
, 						{
							"number" : 11,
							"data" : [ 6, "obj-40", "gain~", "list", 70, 10.0, 5, "obj-33", "kslider", "int", 62, 5, "obj-32", "flonum", "float", 5.0, 5, "obj-31", "flonum", "float", 0.06, 5, "obj-30", "flonum", "float", 293.664764, 5, "obj-28", "number", "int", 0, 5, "obj-21", "flonum", "float", 0.130001, 5, "obj-20", "flonum", "float", 917.702393, 5, "obj-19", "flonum", "float", 0.0, 5, "obj-18", "flonum", "float", 0.31, 5, "obj-17", "flonum", "float", 0.78, 5, "obj-16", "flonum", "float", 0.0, 5, "obj-15", "flonum", "float", 0.17, 5, "obj-14", "flonum", "float", 0.49, 5, "obj-10", "toggle", "int", 0, 5, "obj-8", "flonum", "float", 1.0 ]
						}
, 						{
							"number" : 12,
							"data" : [ 6, "obj-40", "gain~", "list", 70, 10.0, 5, "obj-33", "kslider", "int", 47, 5, "obj-32", "flonum", "float", 5.0, 5, "obj-31", "flonum", "float", 0.06, 5, "obj-30", "flonum", "float", 123.470825, 5, "obj-28", "number", "int", 6, 5, "obj-21", "flonum", "float", 0.130001, 5, "obj-20", "flonum", "float", 42.0, 5, "obj-19", "flonum", "float", 1.059998, 5, "obj-18", "flonum", "float", 0.31, 5, "obj-17", "flonum", "float", 0.78, 5, "obj-16", "flonum", "float", 9.0, 5, "obj-15", "flonum", "float", 3.309998, 5, "obj-14", "flonum", "float", 109.0, 5, "obj-10", "toggle", "int", 0, 5, "obj-8", "flonum", "float", -1.0 ]
						}
 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-7",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 369.0, 358.0, 20.0, 20.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-74",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 394.0, 391.0, 195.0, 22.0 ],
					"style" : "",
					"text" : "prepend /wekinator/control/outputs"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-58",
					"maxclass" : "newobj",
					"numinlets" : 9,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 394.0, 359.0, 156.0, 22.0 ],
					"style" : "",
					"text" : "pack 1. 1. 1. 1. 1. 1. 1. 1. 1."
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-53",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 394.0, 513.0, 137.0, 22.0 ],
					"style" : "",
					"text" : "udpsend localhost 6448"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-57",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 9,
					"outlettype" : [ "float", "float", "float", "float", "float", "float", "float", "float", "float" ],
					"patching_rect" : [ 382.0, 131.0, 169.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 382.0, 131.0, 169.0, 22.0 ],
					"style" : "",
					"text" : "unpack 1. 1. 1. 1. 1. 1. 1. 1. 1."
				}

			}
, 			{
				"box" : 				{
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-54",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 382.0, 99.0, 84.0, 19.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 382.0, 99.0, 111.0, 19.0 ],
					"style" : "",
					"text" : "route /wek/outputs"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-51",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 382.0, 69.0, 106.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 382.0, 69.0, 106.0, 22.0 ],
					"style" : "",
					"text" : "udpreceive 12000"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-2",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 274.0, 366.0, 16.0, 19.0 ],
					"style" : "",
					"text" : "1"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-3",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 274.0, 345.0, 53.0, 19.0 ],
					"style" : "",
					"text" : "loadbang"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 14.0,
					"id" : "obj-4",
					"linecount" : 3,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 31.0, 5.0, 733.0, 53.0 ],
					"style" : "",
					"text" : "blotar~ Example for Wekinator\nTakes 9 continuous control parameters from Wekinator, listening for message /wekinator/outputs on port 12000\nThis patch is also sending control values changed here back to Wekinator (listening on port 6448) to show in the GUI"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-5",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 31.0, 79.0, 241.0, 17.0 ],
					"style" : "",
					"text" : "Requires blotar~ object from PeRColate"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.866667, 0.866667, 0.866667, 1.0 ],
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"format" : 6,
					"htricolor" : [ 0.87, 0.82, 0.24, 1.0 ],
					"id" : "obj-8",
					"maxclass" : "flonum",
					"maximum" : 1.0,
					"minimum" : -1.0,
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 636.0, 256.0, 35.0, 19.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 133.0, 419.0, 35.0, 19.0 ],
					"style" : "",
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"tricolor" : [ 0.75, 0.75, 0.75, 1.0 ],
					"triscale" : 0.9
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"hidden" : 1,
					"id" : "obj-9",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 42.0, 167.0, 31.0, 19.0 ],
					"style" : "",
					"text" : "clear"
				}

			}
, 			{
				"box" : 				{
					"hidden" : 1,
					"id" : "obj-10",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 234.0, 210.0, 15.0, 15.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"hidden" : 1,
					"id" : "obj-11",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 250.0, 171.0, 27.0, 19.0 ],
					"style" : "",
					"text" : "gate"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-12",
					"maxclass" : "preset",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "preset", "int", "preset", "int" ],
					"patching_rect" : [ 36.0, 319.0, 46.0, 39.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 178.0, 118.0, 46.0, 39.0 ],
					"preset_data" : [ 						{
							"number" : 1,
							"data" : [ 5, "obj-33", "kslider", "int", 62, 5, "obj-32", "flonum", "float", 5.0, 5, "obj-31", "flonum", "float", 0.06, 5, "obj-30", "flonum", "float", 293.664764, 5, "obj-28", "number", "int", 0, 5, "obj-21", "flonum", "float", 0.130001, 5, "obj-20", "flonum", "float", 917.702393, 5, "obj-19", "flonum", "float", 1.059998, 5, "obj-18", "flonum", "float", 0.31, 5, "obj-17", "flonum", "float", 0.78, 5, "obj-16", "flonum", "float", 0.0, 5, "obj-15", "flonum", "float", 0.17, 5, "obj-14", "flonum", "float", 0.49, 5, "obj-10", "toggle", "int", 1, 5, "obj-8", "flonum", "float", 1.0 ]
						}
, 						{
							"number" : 2,
							"data" : [ 5, "obj-33", "kslider", "int", 72, 5, "obj-32", "flonum", "float", 0.0, 5, "obj-31", "flonum", "float", 0.0, 5, "obj-30", "flonum", "float", 523.25116, 5, "obj-28", "number", "int", 0, 5, "obj-21", "flonum", "float", 0.0, 5, "obj-20", "flonum", "float", 232.0, 5, "obj-19", "flonum", "float", 0.0, 5, "obj-18", "flonum", "float", 1.63, 5, "obj-17", "flonum", "float", 0.64, 5, "obj-16", "flonum", "float", 3.0, 5, "obj-15", "flonum", "float", 0.99, 5, "obj-14", "flonum", "float", 0.06, 5, "obj-10", "toggle", "int", 0, 5, "obj-8", "flonum", "float", 1.0 ]
						}
, 						{
							"number" : 3,
							"data" : [ 5, "obj-33", "kslider", "int", 65, 5, "obj-32", "flonum", "float", 0.0, 5, "obj-31", "flonum", "float", 0.0, 5, "obj-30", "flonum", "float", 349.228241, 5, "obj-28", "number", "int", 0, 5, "obj-21", "flonum", "float", 0.0, 5, "obj-20", "flonum", "float", 132.0, 5, "obj-19", "flonum", "float", 0.829999, 5, "obj-18", "flonum", "float", 0.55, 5, "obj-17", "flonum", "float", 0.22, 5, "obj-16", "flonum", "float", 2.0, 5, "obj-15", "flonum", "float", 0.95, 5, "obj-14", "flonum", "float", 0.63, 5, "obj-10", "toggle", "int", 0, 5, "obj-8", "flonum", "float", 1.0 ]
						}
, 						{
							"number" : 4,
							"data" : [ 5, "obj-33", "kslider", "int", 72, 5, "obj-32", "flonum", "float", 8.0, 5, "obj-31", "flonum", "float", 0.1, 5, "obj-30", "flonum", "float", 523.25116, 5, "obj-28", "number", "int", 0, 5, "obj-21", "flonum", "float", 0.0, 5, "obj-20", "flonum", "float", 1635.159912, 5, "obj-19", "flonum", "float", 0.82, 5, "obj-18", "flonum", "float", 1.63, 5, "obj-17", "flonum", "float", 0.64, 5, "obj-16", "flonum", "float", 3.0, 5, "obj-15", "flonum", "float", 0.99, 5, "obj-14", "flonum", "float", 0.06, 5, "obj-10", "toggle", "int", 1, 5, "obj-8", "flonum", "float", 1.0 ]
						}
, 						{
							"number" : 5,
							"data" : [ 5, "obj-33", "kslider", "int", 43, 5, "obj-32", "flonum", "float", 0.0, 5, "obj-31", "flonum", "float", 0.0, 5, "obj-30", "flonum", "float", 97.998856, 5, "obj-28", "number", "int", 11, 5, "obj-21", "flonum", "float", 0.0, 5, "obj-20", "flonum", "float", 306.246429, 5, "obj-19", "flonum", "float", 0.0, 5, "obj-18", "flonum", "float", 0.37, 5, "obj-17", "flonum", "float", 0.78, 5, "obj-16", "flonum", "float", 5.0, 5, "obj-15", "flonum", "float", 3.409999, 5, "obj-14", "flonum", "float", 0.0, 5, "obj-10", "toggle", "int", 1, 5, "obj-8", "flonum", "float", 1.0 ]
						}
, 						{
							"number" : 6,
							"data" : [ 5, "obj-33", "kslider", "int", 47, 5, "obj-32", "flonum", "float", 5.0, 5, "obj-31", "flonum", "float", 0.06, 5, "obj-30", "flonum", "float", 123.470825, 5, "obj-28", "number", "int", 6, 5, "obj-21", "flonum", "float", 0.130001, 5, "obj-20", "flonum", "float", 42.0, 5, "obj-19", "flonum", "float", 1.059998, 5, "obj-18", "flonum", "float", 0.31, 5, "obj-17", "flonum", "float", 0.78, 5, "obj-16", "flonum", "float", 9.0, 5, "obj-15", "flonum", "float", 3.309998, 5, "obj-14", "flonum", "float", 109.0, 5, "obj-10", "toggle", "int", 0, 5, "obj-8", "flonum", "float", -1.0 ]
						}
, 						{
							"number" : 7,
							"data" : [ 5, "obj-33", "kslider", "int", 55, 5, "obj-32", "flonum", "float", 5.0, 5, "obj-31", "flonum", "float", 0.06, 5, "obj-30", "flonum", "float", 195.997711, 5, "obj-28", "number", "int", 6, 5, "obj-21", "flonum", "float", 0.130001, 5, "obj-20", "flonum", "float", 42.0, 5, "obj-19", "flonum", "float", 1.059998, 5, "obj-18", "flonum", "float", 0.31, 5, "obj-17", "flonum", "float", 0.78, 5, "obj-16", "flonum", "float", 9.0, 5, "obj-15", "flonum", "float", 3.309998, 5, "obj-14", "flonum", "float", 109.0, 5, "obj-10", "toggle", "int", 0, 5, "obj-8", "flonum", "float", 0.02 ]
						}
, 						{
							"number" : 8,
							"data" : [ 5, "obj-33", "kslider", "int", 43, 5, "obj-32", "flonum", "float", 5.0, 5, "obj-31", "flonum", "float", 47.0, 5, "obj-30", "flonum", "float", 97.998856, 5, "obj-28", "number", "int", 6, 5, "obj-21", "flonum", "float", 0.130001, 5, "obj-20", "flonum", "float", 42.0, 5, "obj-19", "flonum", "float", 1.53, 5, "obj-18", "flonum", "float", 0.059999, 5, "obj-17", "flonum", "float", 0.78, 5, "obj-16", "flonum", "float", 78.0, 5, "obj-15", "flonum", "float", 3.309998, 5, "obj-14", "flonum", "float", 109.0, 5, "obj-10", "toggle", "int", 0, 5, "obj-8", "flonum", "float", 0.02 ]
						}
, 						{
							"number" : 9,
							"data" : [ 5, "obj-33", "kslider", "int", 72, 5, "obj-32", "flonum", "float", 0.0, 5, "obj-31", "flonum", "float", 0.0, 5, "obj-30", "flonum", "float", 523.25116, 5, "obj-28", "number", "int", 0, 5, "obj-21", "flonum", "float", 0.0, 5, "obj-20", "flonum", "float", 1635.159912, 5, "obj-19", "flonum", "float", 0.829999, 5, "obj-18", "flonum", "float", 0.55, 5, "obj-17", "flonum", "float", 0.22, 5, "obj-16", "flonum", "float", 2.0, 5, "obj-15", "flonum", "float", 0.95, 5, "obj-14", "flonum", "float", 0.63, 5, "obj-10", "toggle", "int", 1, 5, "obj-8", "flonum", "float", 1.0 ]
						}
, 						{
							"number" : 10,
							"data" : [ 5, "obj-33", "kslider", "int", 84, 5, "obj-32", "flonum", "float", 0.0, 5, "obj-31", "flonum", "float", 0.0, 5, "obj-30", "flonum", "float", 1046.502319, 5, "obj-28", "number", "int", 0, 5, "obj-21", "flonum", "float", 0.0, 5, "obj-20", "flonum", "float", 3270.319824, 5, "obj-19", "flonum", "float", 0.0, 5, "obj-18", "flonum", "float", 1.63, 5, "obj-17", "flonum", "float", 0.64, 5, "obj-16", "flonum", "float", 3.0, 5, "obj-15", "flonum", "float", 2.0, 5, "obj-14", "flonum", "float", 0.0, 5, "obj-10", "toggle", "int", 1, 5, "obj-8", "flonum", "float", 0.0 ]
						}
 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"hidden" : 1,
					"id" : "obj-13",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 53.0, 139.0, 29.0, 19.0 ],
					"style" : "",
					"text" : "mtof"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.866667, 0.866667, 0.866667, 1.0 ],
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"format" : 6,
					"htricolor" : [ 0.87, 0.82, 0.24, 1.0 ],
					"id" : "obj-14",
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 526.0, 256.0, 35.0, 19.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 85.0, 369.0, 35.0, 19.0 ],
					"style" : "",
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"tricolor" : [ 0.75, 0.75, 0.75, 1.0 ],
					"triscale" : 0.9
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.866667, 0.866667, 0.866667, 1.0 ],
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"format" : 6,
					"htricolor" : [ 0.87, 0.82, 0.24, 1.0 ],
					"id" : "obj-15",
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 581.0, 256.0, 35.0, 19.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 140.0, 369.0, 35.0, 19.0 ],
					"style" : "",
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"tricolor" : [ 0.75, 0.75, 0.75, 1.0 ],
					"triscale" : 0.9
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.866667, 0.866667, 0.866667, 1.0 ],
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"format" : 6,
					"htricolor" : [ 0.87, 0.82, 0.24, 1.0 ],
					"id" : "obj-16",
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 31.0, 256.0, 35.0, 19.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 31.0, 256.0, 35.0, 19.0 ],
					"style" : "",
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"tricolor" : [ 0.75, 0.75, 0.75, 1.0 ],
					"triscale" : 0.9
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.866667, 0.866667, 0.866667, 1.0 ],
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"format" : 6,
					"htricolor" : [ 0.87, 0.82, 0.24, 1.0 ],
					"id" : "obj-17",
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 86.0, 256.0, 35.0, 19.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 86.0, 256.0, 35.0, 19.0 ],
					"style" : "",
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"tricolor" : [ 0.75, 0.75, 0.75, 1.0 ],
					"triscale" : 0.9
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.866667, 0.866667, 0.866667, 1.0 ],
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"format" : 6,
					"htricolor" : [ 0.87, 0.82, 0.24, 1.0 ],
					"id" : "obj-18",
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 141.0, 256.0, 35.0, 19.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 141.0, 256.0, 35.0, 19.0 ],
					"style" : "",
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"tricolor" : [ 0.75, 0.75, 0.75, 1.0 ],
					"triscale" : 0.9
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.866667, 0.866667, 0.866667, 1.0 ],
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"format" : 6,
					"htricolor" : [ 0.87, 0.82, 0.24, 1.0 ],
					"id" : "obj-19",
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 196.0, 256.0, 35.0, 19.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 196.0, 256.0, 35.0, 19.0 ],
					"style" : "",
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"tricolor" : [ 0.75, 0.75, 0.75, 1.0 ],
					"triscale" : 0.9
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.866667, 0.866667, 0.866667, 1.0 ],
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"format" : 6,
					"htricolor" : [ 0.87, 0.82, 0.24, 1.0 ],
					"id" : "obj-20",
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 251.0, 256.0, 45.0, 19.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 31.0, 310.0, 45.0, 19.0 ],
					"style" : "",
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"tricolor" : [ 0.75, 0.75, 0.75, 1.0 ],
					"triscale" : 0.9
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.866667, 0.866667, 0.866667, 1.0 ],
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"format" : 6,
					"htricolor" : [ 0.87, 0.82, 0.24, 1.0 ],
					"id" : "obj-21",
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 306.0, 256.0, 35.0, 19.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 86.0, 310.0, 35.0, 19.0 ],
					"style" : "",
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"tricolor" : [ 0.75, 0.75, 0.75, 1.0 ],
					"triscale" : 0.9
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-22",
					"linecount" : 2,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 586.0, 227.0, 72.0, 27.0 ],
					"presentation" : 1,
					"presentation_linecount" : 2,
					"presentation_rect" : [ 145.0, 340.0, 72.0, 27.0 ],
					"style" : "",
					"text" : "Bore/distortion gain"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-23",
					"linecount" : 2,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 522.0, 228.0, 60.0, 27.0 ],
					"presentation" : 1,
					"presentation_linecount" : 2,
					"presentation_rect" : [ 81.0, 341.0, 60.0, 27.0 ],
					"style" : "",
					"text" : "jet/feedback coeff"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-24",
					"linecount" : 2,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 467.0, 228.0, 56.0, 27.0 ],
					"presentation" : 1,
					"presentation_linecount" : 2,
					"presentation_rect" : [ 26.0, 341.0, 56.0, 27.0 ],
					"style" : "",
					"text" : "Flute/string freq"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-25",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 410.0, 240.0, 47.0, 17.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 190.0, 294.0, 47.0, 17.0 ],
					"style" : "",
					"text" : "vib amp"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-26",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 355.0, 239.0, 47.0, 17.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 135.0, 293.0, 47.0, 17.0 ],
					"style" : "",
					"text" : "vib freq"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"hidden" : 1,
					"id" : "obj-27",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 41.0, 205.0, 62.0, 19.0 ],
					"style" : "",
					"text" : "prepend mic"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.866667, 0.866667, 0.866667, 1.0 ],
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"hidden" : 1,
					"htricolor" : [ 0.87, 0.82, 0.24, 1.0 ],
					"id" : "obj-28",
					"maxclass" : "number",
					"maximum" : 11,
					"minimum" : 0,
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 41.0, 187.0, 35.0, 19.0 ],
					"style" : "",
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"tricolor" : [ 0.75, 0.75, 0.75, 1.0 ],
					"triscale" : 0.9
				}

			}
, 			{
				"box" : 				{
					"hidden" : 1,
					"id" : "obj-29",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 31.0, 141.0, 15.0, 15.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.866667, 0.866667, 0.866667, 1.0 ],
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"format" : 6,
					"htricolor" : [ 0.87, 0.82, 0.24, 1.0 ],
					"id" : "obj-30",
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 471.0, 256.0, 47.0, 19.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 30.0, 369.0, 47.0, 19.0 ],
					"style" : "",
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"tricolor" : [ 0.75, 0.75, 0.75, 1.0 ],
					"triscale" : 0.9
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.866667, 0.866667, 0.866667, 1.0 ],
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"format" : 6,
					"htricolor" : [ 0.87, 0.82, 0.24, 1.0 ],
					"id" : "obj-31",
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 416.0, 256.0, 35.0, 19.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 196.0, 310.0, 35.0, 19.0 ],
					"style" : "",
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"tricolor" : [ 0.75, 0.75, 0.75, 1.0 ],
					"triscale" : 0.9
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.866667, 0.866667, 0.866667, 1.0 ],
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"format" : 6,
					"htricolor" : [ 0.87, 0.82, 0.24, 1.0 ],
					"id" : "obj-32",
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 361.0, 256.0, 35.0, 19.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 141.0, 310.0, 35.0, 19.0 ],
					"style" : "",
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"tricolor" : [ 0.75, 0.75, 0.75, 1.0 ],
					"triscale" : 0.9
				}

			}
, 			{
				"box" : 				{
					"blackkeycolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"hkeycolor" : [ 0.501961, 0.501961, 0.501961, 1.0 ],
					"id" : "obj-33",
					"maxclass" : "kslider",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "int", "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 31.0, 98.0, 294.0, 34.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 24.0, 477.0, 294.0, 34.0 ],
					"range" : 72,
					"style" : "",
					"whitekeycolor" : [ 1.0, 1.0, 1.0, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-34",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 239.0, 432.0, 27.0, 19.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 136.0, 46.0, 27.0, 19.0 ],
					"style" : "",
					"text" : "stop"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-35",
					"linecount" : 2,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 308.0, 227.0, 47.0, 27.0 ],
					"presentation" : 1,
					"presentation_linecount" : 2,
					"presentation_rect" : [ 88.0, 281.0, 47.0, 27.0 ],
					"style" : "",
					"text" : "noise gain"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-36",
					"linecount" : 2,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 244.0, 227.0, 62.0, 27.0 ],
					"presentation" : 1,
					"presentation_linecount" : 2,
					"presentation_rect" : [ 24.0, 281.0, 62.0, 27.0 ],
					"style" : "",
					"text" : "Jet/feedback freq"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-37",
					"linecount" : 2,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 191.0, 227.0, 47.0, 27.0 ],
					"presentation" : 1,
					"presentation_linecount" : 2,
					"presentation_rect" : [ 191.0, 227.0, 47.0, 27.0 ],
					"style" : "",
					"text" : "breath pressure"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-38",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 132.0, 238.0, 49.0, 17.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 132.0, 238.0, 49.0, 17.0 ],
					"style" : "",
					"text" : "body size"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-39",
					"linecount" : 2,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 79.0, 226.0, 49.0, 27.0 ],
					"presentation" : 1,
					"presentation_linecount" : 2,
					"presentation_rect" : [ 79.0, 226.0, 49.0, 27.0 ],
					"style" : "",
					"text" : "pluck position"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-40",
					"interpinlet" : 1,
					"maxclass" : "gain~",
					"numinlets" : 2,
					"numoutlets" : 2,
					"orientation" : 2,
					"outlettype" : [ "signal", "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 156.0, 307.0, 77.0, 90.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 35.0, 96.0, 77.0, 90.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-41",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 140.0, 432.0, 65.0, 19.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 37.0, 46.0, 65.0, 19.0 ],
					"style" : "",
					"text" : "startwindow"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-42",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 0,
					"patching_rect" : [ 209.0, 432.0, 29.0, 19.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 106.0, 46.0, 29.0, 19.0 ],
					"style" : "",
					"text" : "dac~"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.407843, 0.407843, 0.407843, 1.0 ],
					"coldcolor" : [ 0.0, 0.658824, 0.0, 1.0 ],
					"id" : "obj-43",
					"interval" : 100,
					"maxclass" : "meter~",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "float" ],
					"patching_rect" : [ 139.0, 307.0, 17.0, 91.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 16.0, 94.0, 17.0, 91.0 ],
					"style" : "",
					"tepidcolor" : [ 0.6, 0.729412, 0.0, 1.0 ],
					"warmcolor" : [ 0.85098, 0.85098, 0.0, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"color" : [ 0.8, 0.611765, 0.380392, 1.0 ],
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-44",
					"maxclass" : "newobj",
					"numinlets" : 12,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 31.0, 283.0, 618.0, 19.0 ],
					"style" : "",
					"text" : "blotar~"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-45",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 23.0, 228.0, 52.0, 17.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 23.0, 228.0, 52.0, 17.0 ],
					"style" : "",
					"text" : "pluck amp"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-46",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 253.0, 212.0, 100.0, 17.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 253.0, 212.0, 100.0, 17.0 ],
					"style" : "",
					"text" : "link with bore freq"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"hidden" : 1,
					"id" : "obj-47",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "float" ],
					"patching_rect" : [ 250.0, 193.0, 38.0, 19.0 ],
					"style" : "",
					"text" : "/ 0.32"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-48",
					"linecount" : 6,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 671.0, 222.0, 99.0, 67.0 ],
					"presentation" : 1,
					"presentation_linecount" : 6,
					"presentation_rect" : [ 27.0, 397.0, 99.0, 67.0 ],
					"style" : "",
					"text" : "friggin' filter ratio (interpolates between the one-pole filter of the flute and the lowpass fliter of the plucked string. nutty."
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-49",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 143.0, 412.0, 73.0, 17.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 40.0, 26.0, 73.0, 17.0 ],
					"style" : "",
					"text" : "• start audio."
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-50",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 36.0, 362.0, 100.0, 17.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 181.0, 93.0, 100.0, 17.0 ],
					"style" : "",
					"text" : "• try these presets."
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-11", 0 ],
					"disabled" : 0,
					"hidden" : 1,
					"midpoints" : [ 243.0, 167.0, 259.5, 167.0 ],
					"source" : [ "obj-10", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-47", 0 ],
					"disabled" : 0,
					"hidden" : 1,
					"source" : [ "obj-11", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-40", 0 ],
					"disabled" : 0,
					"hidden" : 1,
					"source" : [ "obj-12", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-11", 1 ],
					"disabled" : 0,
					"hidden" : 1,
					"midpoints" : [ 62.5, 163.0, 267.5, 163.0 ],
					"source" : [ "obj-13", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-30", 0 ],
					"disabled" : 0,
					"hidden" : 1,
					"midpoints" : [ 62.5, 159.0, 480.5, 159.0 ],
					"source" : [ "obj-13", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-44", 9 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-14", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-58", 6 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-14", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-44", 10 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-15", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-58", 7 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-15", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-44", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-16", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-44", 1 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-17", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-44", 2 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-18", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-44", 3 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-19", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-58", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-19", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-12", 0 ],
					"disabled" : 0,
					"hidden" : 1,
					"source" : [ "obj-2", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-59", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-2", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-44", 4 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-20", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-58", 1 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-20", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-44", 5 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-21", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-58", 2 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-21", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-44", 0 ],
					"disabled" : 0,
					"hidden" : 1,
					"midpoints" : [ 50.5, 277.0, 40.5, 277.0 ],
					"source" : [ "obj-27", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-27", 0 ],
					"disabled" : 0,
					"hidden" : 1,
					"source" : [ "obj-28", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-44", 0 ],
					"disabled" : 0,
					"hidden" : 1,
					"source" : [ "obj-29", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-3", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-44", 8 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-30", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-58", 5 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-30", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-44", 7 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-31", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-58", 4 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-31", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-44", 6 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-32", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-58", 3 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-32", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-13", 0 ],
					"disabled" : 0,
					"hidden" : 1,
					"midpoints" : [ 40.5, 136.0, 62.5, 136.0 ],
					"source" : [ "obj-33", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-29", 0 ],
					"disabled" : 0,
					"hidden" : 1,
					"source" : [ "obj-33", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-42", 0 ],
					"disabled" : 0,
					"hidden" : 1,
					"source" : [ "obj-34", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-42", 1 ],
					"disabled" : 0,
					"hidden" : 1,
					"midpoints" : [ 165.5, 421.0, 228.5, 421.0 ],
					"source" : [ "obj-40", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-42", 0 ],
					"disabled" : 0,
					"hidden" : 1,
					"midpoints" : [ 165.5, 421.0, 218.5, 421.0 ],
					"source" : [ "obj-40", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-43", 0 ],
					"disabled" : 0,
					"hidden" : 1,
					"source" : [ "obj-40", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-42", 0 ],
					"disabled" : 0,
					"hidden" : 1,
					"source" : [ "obj-41", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-40", 0 ],
					"disabled" : 0,
					"hidden" : 1,
					"midpoints" : [ 40.5, 303.0, 165.5, 303.0 ],
					"source" : [ "obj-44", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-20", 0 ],
					"disabled" : 0,
					"hidden" : 1,
					"source" : [ "obj-47", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-54", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-51", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-57", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-54", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-20", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-55", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-30", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-56", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-14", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-57", 6 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-15", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-57", 7 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-19", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-57", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-21", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-57", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-31", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-57", 4 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-32", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-57", 3 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-60", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-57", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-61", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-57", 5 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-8", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-57", 8 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-74", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-58", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-62", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 266.5, 508.0, 265.5, 508.0 ],
					"source" : [ "obj-59", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-55", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-60", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-56", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-61", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-7", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-62", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-58", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-7", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-53", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-74", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-44", 11 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-8", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-58", 8 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-8", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-44", 0 ],
					"disabled" : 0,
					"hidden" : 1,
					"midpoints" : [ 51.5, 277.0, 40.5, 277.0 ],
					"source" : [ "obj-9", 0 ]
				}

			}
 ],
		"dependency_cache" : [ 			{
				"name" : "blotar~.mxo",
				"type" : "iLaX"
			}
 ],
		"embedsnapshot" : 0
	}

}
