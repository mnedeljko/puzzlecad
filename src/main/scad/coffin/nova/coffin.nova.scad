include <puzzlecad.scad>

$burr_scale = 27;
$burr_inset = 0;
$burr_bevel = 0;

*solid();
*twocolor_color1();
*twocolor_color2();
fivecolor_color1();
*diagonal_strut();

module solid() {
    
    burr_plate([
        [".x{components={z+x-,y+z+,z+y+,z+x+}}.|.x{components={z+,y-z+,y+z+}}.|.x{components={z+x-,y-z+,z+y-,z+x+}}.",
         "x{components=x+z-}x{components={x-z-,z-x-,z-y+,z-x+,x+z-}}x{components=x-z-}|.x{components=z-}.|x{components=x+z-}x{components={x-z-,z-x-,z-y-,z-x+,x+z-}}x{components=x-z-}"]
    ], $post_rotate = [0, 45, 0], $post_translate = [-(sqrt(2)+1)/2, 0, (sqrt(2)-1)/2]);
    
}

module twocolor_color1() {
    
    burr_piece([
        ".x{components={y+z+,z+y+,z+x-}}.|.x{components={z+,y-z+,y+z+}}.|.x{components={y-z+,z+y-,z+x+}}.",
        "x{components=x+z-}x{components={z-y+,z-x-,x-z-}}|.x{components=z-}x{components={},connect=dx-y-~}|.x{components={z-y-,x+z-,z-x+},connect=dx+y+~}x{components=x-z-}"
    ], $post_rotate = [0, 45, 0], $post_translate = [-(sqrt(2)+1)/2, 0, (sqrt(2)-1)/2]);
    
}

module twocolor_color2() {
    
    burr_piece([
        "x{components=z+y+,connect=dz+y+}", "x{components=z-y+}"
    ], $post_rotate = [-45, 0, 0], $post_translate = [1, 0, -1/2]);

}

module fivecolor_color1() {
    
    burr_piece([
        ".x{components={y+z+,z+y+}}.|.x{components={z+,y-z+,y+z+}}.|.x{components={y-z+,z+y-}}.",
        ".x{components={z-y+}}|.x{components=z-,connect=lx+y-~}x{components={},connect=lx-y-~}|.x{components=z-y-,connect=lx+y+~}x{components={},connect=lx-y+~}"
    ], $post_rotate = [0, 45, 0], $post_translate = [-(sqrt(2)+1)/2, 0, (sqrt(2)-1)/2]);
    
}

/*
module multicolor() {
    burr_plate([
        [".x{components=y+z+,diag_connect=fy+z+}.|.x{components={z+,y-z+,y+z+}}.|.x{components={z+x-,y-z+,z+y-,z+x+}}.", "...|.x{components=z-}.|x{components=x+z-}x{components={x-z-,z-x-,z-y-,z-x+,x+z-}}x{components=x-z-}"],
        ["x{components={z+x+,z+y+},diag_connect=mz+y+}.", "x{components={z-x+,z-y+,x+z-}}x{components=x-z-}"]
    ], $post_rotate = [0, 45, 0], $post_translate = [-1/2, 0, -1/2]);
}
*/