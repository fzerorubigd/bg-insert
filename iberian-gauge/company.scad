$card_lx = 72;
$card_ly = 51;
$height = 20;
$border = 2;


module emptyBox(x, y, h, border) {
    difference() {
        cube([x+(border*2), y+(border*2), h]);
        translate([border, border, border]) 
            cube([x, y, h]);
    }
}

module doubleBox(x,y,h , border) {
    difference() {
        union() {
            emptyBox(x, y, h, border);
            translate([0, y+border, 0])
                emptyBox(x, y, h, border);
        }


        translate([(x+(border*2))/2, -1, h]) {
            difference() {
                rotate([-90,0,0]){
                    cylinder(h=h, r = h+1);
                }
                translate([-h,-1,1])
                    cube(h*3);
            }
        }

    }
}

module baseBox() {
    difference() {
        doubleBox($card_lx, $card_ly, $height, $border);
        translate([-1,-1,16]) 
            cube([$border,$card_ly*3, 5]);
        translate([$card_lx+$border+1,-1,16]) 
            cube([$border,$card_ly*3, 5]);
        translate([-1,-1,16])
            cube([$card_lx*3, $border, 5]);
        translate([-1,($card_ly+$border)*2+1,16])
            cube([$card_lx*3, $border, 5]);
        translate([$card_lx/3,$card_ly, $height-3])
            cube([27,$border*3, 4]);
    }
}

module lidBase() {
    translate ([$card_lx+3*$border,0,0])
        emptyBox($card_lx+$border, 2*$card_ly+2*$border, 5,1);
}

baseBox();
lidBase();