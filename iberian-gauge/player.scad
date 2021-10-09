$card_lx = 50;
$card_ly = 72;
$height = 20;
$border = 2;

module emptyBox(x, y, h, border, lowBorder) {
    lower = (is_undef(lowBorder)) ? border : lowBorder;
    difference() {
        cube([x+(border*2), y+(border*2), h]);
        translate([border, border, lower]) 
            cube([x, y, h]);
    }

}


module player() {
    difference() {
        emptyBox($card_lx, $card_ly-1, $height, $border);
        translate([-1,-1,16]) 
            cube([$border,$card_ly*3, 5]);
        translate([$card_lx+$border+1,-1,16]) 
            cube([$border,$card_ly*3, 5]);
        translate([-1,-1,16])
            cube([$card_lx*3, $border, 5]);
        translate([-1,$card_ly+$border,16])
            cube([$card_lx*3, $border, 5]);
        translate([($card_lx+($border*2))/2, -1, $height+5]) {
            rotate([-90,0,0]){
                cylinder(h=10, r = 10+1);
            }
        }
    }
}

module lidPlayer() {
    translate ([$card_lx+3*$border,0,0])
        emptyBox($card_lx+$border, $card_ly+$border-1, 5,1, $border);
}

player();
lidPlayer();