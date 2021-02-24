/*
 * Copyright (C) 2019 makr@makr.zone
 *
 * This 3D printed feeder is inteded to be used together with the "BlindsFeeder" feeder in OpenPNP. 
 *
 * This file is part of OpenPnP. 
 *
 * OpenPnP is free software: you can redistribute it and/or modify it under the terms of the GNU
 * General Public License as published by the Free Software Foundation, either version 3 of the
 * License, or (at your option) any later version.
 * 
 * OpenPnP is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even
 * the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General
 * Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License along with OpenPnP. If not, see
 * <http://www.gnu.org/licenses/>.
 * 
 * For more information about OpenPnP visit http://openpnp.org
 */

// Include the BlindsFeeder Library. 
// To learn the details about available parameters, please read the extensive comments in the library file. 
// The library also defines some 3D printing constants that you might want to tune along with some advice 
// how to setup your slicer. 
include <BlindsFeeder-Library.scad>

// All dimensions in Millimeters.

// Let's create some tape definitions
// Again, please read the extensive comments in the library file to learn what 
// parameters are avaialable and what exactly they mean and do. 
tape0402 = TapeDefinition(
    tape_width=8,
    tape_thickness=0.5,
    pocket_pitch=2,
    pocket_width=2.25,
    tape_play=-0.03,
    cover_play=0.14);

tape08mm = TapeDefinition(
    tape_width=8,
    tape_thickness=0.4,
    pocket_width=4,
    pocket_portrusion=3,
    tape_play=0.1,
    cover_play=0.15,
    sprocket_thorns=3,
    blinds=false);

tapeSOT3 = TapeDefinition(
    tape_width=8,
    tape_thickness=0.45,
    pocket_portrusion=1.65,
    pocket_pitch=4,
    pocket_width=4,
    tape_play=0.05,
    cover_play=0.1,
    sprocket_thorns=2,
    blinds=false);

tape12mm = TapeDefinition(
    tape_width=12,
    tape_thickness=0.4,
    pocket_portrusion=8.25,
    pocket_pitch=8,
    pocket_width=8.1,
    tape_play=0.1,
    cover_play=0.15,
    sprocket_thorns=3,
    blinds=false);
    
    
tape16mm = TapeDefinition(
    tape_width=16,
    tape_thickness=0.4,
    pocket_portrusion=8.25,
    pocket_pitch=8,
    pocket_width=11.1,
    tape_play=0.1,
    cover_play=0.0,
    sprocket_thorns=3,
    blinds=false);


tape24mm = TapeDefinition(
    tape_width=24,
    tape_thickness=0.4,
    pocket_portrusion=8.25,
    pocket_pitch=8,
    pocket_width=18.1,
    tape_play=0.0,
    cover_play=0.0,
    sprocket_thorns=3,
    blinds=false);

tape32mm = TapeDefinition(
    tape_width=32,
    tape_thickness=0.4,
    pocket_portrusion=8.25,
    pocket_pitch=8,
    pocket_width=26.1,
    tape_play=0.0,
    cover_play=0.0,
    sprocket_thorns=3,
    blinds=false);


tape44mm = TapeDefinition(
    tape_width=44,
    tape_thickness=0.4,
    pocket_portrusion=8.25,
    pocket_pitch=8,
    pocket_width=34.1,
    tape_play=0.0,
    cover_play=0.0,
    sprocket_thorns=3,
    blinds=false);


trayQLPF64 = TapeDefinition(
    tape_width=16,
    tape_thickness=1.6,
    pocket_pitch=16,
    pocket_width=12.1,
    pocket_length=12.1,
    tape_play=0.0,
    cover_play=0.1,
    blinds=false,
    sprocket_thorns=0);


// Create the feeder array with these tape definitions.
// Note the BlindsFeeder has a myriad of parameters you can tweak, the ones used here are just the most important. 
// See the Library file to learn more. 
BlindsFeeder(
    // Tape length from feeder edge to edge, usually multiples of 4mm. 
    // Other values are supported if you manually adjust the edge distance in the OpenPNP feeder.
    tape_length=52,
    flange=false,
        // Underhang of the wall sides. The idea is that the walls are narrowest at the top, 
    // clamping the tape sidewas but also driving it down.
    underhang=0.15,
    // Overhang of walls on top of the tape thickness. Should create a certain tension to snap
    // the tape in and down.
    overhang=0.35,
    // Thickness of the overhang.
    overhang_thickness=layer_height*3,
    cover_slot_thickness=0.000,
    cover_slot_mid=0,
    cover_slot=0,
    cover_thickness=0,
    cover_overhang=0,
    cover_tensions=0,
    cover_vertical_play=0,
    
    // Number of lanes per tape definition.  
    arrayed_tape_lanes=      [1,        0,        1,        0,         0],
    // The arrayed tape definitions.
    arrayed_tapes=           [tape44mm, tape32mm, tape24mm, tape16mm, tape12mm],
    
    debug = false,
    cover = false,
    tray = true
);

