// ==============================================================
// All maps taken from https://github.com/begoon/sokoban-maps/ 
// ==============================================================

var maps = [

	// ========== Map 0 ==========

	"    #####             \n" +
	"    #   #             \n" +
	"    #$  #             \n" +
	"  ###  $###           \n" +
	"  #  $  $ #           \n" +
	"### # ### #     ######\n" +
	"#   # ### #######  ..#\n" +
	"# $  $             ..#\n" +
	"##### #### #@####  ..#\n" +
	"    #      ###  ######\n" +
	"    ########          ",
	
	// ========== Map 1 ==========

	"############  \n" +
	"#..  #     ###\n" +
	"#..  # $  $  #\n" +
	"#..  #$####  #\n" +
	"#..    @ ##  #\n" +
	"#..  # #  $ ##\n" +
	"###### ##$ $ #\n" +
	"  # $  $ $ $ #\n" +
	"  #    #     #\n" +
	"  ############",

	// ========== Map 2 ==========

	"        ######## \n" +
	"        #     @# \n" +
	"        # $#$ ## \n" +
	"        # $  $#  \n" +
	"        ##$ $ #  \n" +
	"######### $ # ###\n" +
	"#....  ## $  $  #\n" +
	"##...    $  $   #\n" +
	"#....  ##########\n" +
	"########         ",

	// ========== Map 3 ==========

	"              ########\n" +
	"              #  ....#\n" +
	"   ############  ....#\n" +
	"   #    #  $ $   ....#\n" +
	"   # $$$#$  $ #  ....#\n" +
	"   #  $     $ #  ....#\n" +
	"   # $$ #$ $ $########\n" +
	"####  $ #     #       \n" +
	"#   # #########       \n" +
	"#    $  ##            \n" +
	"# $$#$$ @#            \n" +
	"#   #   ##            \n" +
	"#########             ",

	// ========== Map 4 ==========

	"        #####    \n" +
	"        #   #####\n" +
	"        # #$##  #\n" +
	"        #     $ #\n" +
	"######### ###   #\n" +
	"#....  ## $  $###\n" +
	"#....    $ $$ ## \n" +
	"#....  ##$  $ @# \n" +
	"#########  $  ## \n" +
	"        # $ $  # \n" +
	"        ### ## # \n" +
	"          #    # \n" +
	"          ###### ",

	// ========== Map 5 ==========

	"######  ### \n"+
	"#..  # ##@##\n"+
	"#..  ###   #\n"+
	"#..     $$ #\n"+
	"#..  # # $ #\n"+
	"#..### # $ #\n"+
	"#### $ #$  #\n"+
	"   #  $# $ #\n"+
	"   # $  $  #\n"+
	"   #  ##   #\n"+
	"   #########",
	
	// ========== Map 6 ==========

	"       ##### \n" +
	" #######   ##\n" +
	"## # @## $$ #\n" +
	"#    $      #\n" +
	"#  $  ###   #\n" +
	"### #####$###\n" +
	"# $  ### ..# \n" +
	"# $ $ $ ...# \n" +
	"#    ###...# \n" +
	"# $$ # #...# \n" +
	"#  ### ##### \n" +
	"####         ",

	// ========== Map 7 ==========

	"  ####          \n" +
	"  #  ###########\n" +
	"  #    $   $ $ #\n" +
	"  # $# $ #  $  #\n" +
	"  #  $ $  #    #\n" +
	"### $# #  #### #\n" +
	"#@#$ $ $  ##   #\n" +
	"#    $ #$#   # #\n" +
	"##  $    $ $ $ #\n" +
	" ####  #########\n" +
	"  ###  ###      \n" +
	"  #      #      \n" +
	"  #      #      \n" +
	"  #......#      \n" +
	"  #......#      \n" +
	"  #......#      \n" +
	"  ########      ",

	// ========== Map 8 ==========

	"          #######\n" +
	"          #  ...#\n" +
	"      #####  ...#\n" +
	"      #      ...#\n" +
	"      #  ##  ...#\n" +
	"      ## ##  ...#\n" +
	"     ### ########\n" +
	"     # $$$ ##    \n" +
	" #####  $ $ #####\n" +
	"##   #$ $   #   #\n" +
	"#@ $  $    $  $ #\n" +
	"###### $$ $ #####\n" +
	"     # $    #    \n" +
	"     #### ###    \n" +
	"        #  #     \n" +
	"        #  #     \n" +
	"        #  #     \n" +
	"        ####     ",

	// ========== Map 9 ==========

	"              ####   \n" +
	"         ######  #   \n" +
	"         #       #   \n" +
	"         #  #### ### \n" +
	" ###  ##### ###    # \n" +
	"##@####   $$$ #    # \n" +
	"# $$   $$ $   #....##\n" +
	"#  $$$#    $  #.....#\n" +
	"# $   # $$ $$ #.....#\n" +
	"###   #  $    #.....#\n" +
	"  #   # $ $ $ #.....#\n" +
	"  # ####### ###.....#\n" +
	"  #   #  $ $  #.....#\n" +
	"  ### # $$ $ $#######\n" +
	"    # #  $      #    \n" +
	"    # # $$$ $$$ #    \n" +
	"    # #       # #    \n" +
	"    # ######### #    \n" +
	"    #           #    \n" +
	"    #############    ",

	// ========== Map 10 =========

	"          ####     \n" +
	"     #### #  #     \n" +
	"   ###  ###$ #     \n" +
	"  ##   @  $  #     \n" +
	" ##  $ $$## ##     \n" +
	" #  #$##     #     \n" +
	" # # $ $$ # ###    \n" +
	" #   $ #  # $ #####\n" +
	"####    #  $$ #   #\n" +
	"#### ## $         #\n" +
	"#.    ###  ########\n" +
	"#.. ..# ####       \n" +
	"#...#.#            \n" +
	"#.....#            \n" +
	"#######            ",

	// ========== Map 11 =========

	"  #########  \n" +
	"  #*.*#*.*#  \n" +
	"  #.*.*.*.#  \n" +
	"  #*.*.*.*#  \n" +
	"  #.*.*.*.#  \n" +
	"  #*.*.*.*#  \n" +
	"  ###   ###  \n" +
	"    #   #    \n" +
	"###### ######\n" +
	"#           #\n" +
	"# $ $ $ $ $ #\n" +
	"## $ $ $ $ ##\n" +
	" #$ $ $ $ $# \n" +
	" #   $@$   # \n" +
	" #  #####  # \n" +
	" ####   #### ",

	// ========== Map 12 =========

	"    #########       \n" +
	"  ###   ##  #####   \n" +
	"###      #  #   ####\n" +
	"#  $$ #$ #  #  ... #\n" +
	"# #  $#@$## # #.#. #\n" +
	"#  ## #$  #    ... #\n" +
	"# $#    $ # # #.#. #\n" +
	"#    ##  ##$ $ ... #\n" +
	"# $ ##   #  #$#.#. #\n" +
	"## $$  $   $  $... #\n" +
	" #$  ######    ##  #\n" +
	" #   #    ##########\n" +
	" #####              ",

	// ========== Map 13 =========

	"################ \n" +
	"#              # \n" +
	"# # ######     # \n" +
	"# #  $ $ $ $#  # \n" +
	"# #   $@$   ## ##\n" +
	"# # #$ $ $###...#\n" +
	"# #   $ $  ##...#\n" +
	"# ###$$$ $ ##...#\n" +
	"#     # ## ##...#\n" +
	"#####   ## ##...#\n" +
	"    #####     ###\n" +
	"        #     #  \n" +
	"        #######  ",

	// ========== Map 14 =========

	"       ####      \n" +
	"    ####  #      \n" +
	"   ##  #  #      \n" +
	"   #  $ $ #      \n" +
	" ### #$   ####   \n" +
	" #  $  ##$   #   \n" +
	" #  # @ $ # $#   \n" +
	" #  #      $ ####\n" +
	" ## ####$##     #\n" +
	" # $#.....# #   #\n" +
	" #  $...*. $# ###\n" +
	"##  #.....#   #  \n" +
	"#   ### #######  \n" +
	"# $$  #  #       \n" +
	"#  #     #       \n" +
	"######   #       \n" +
	"     #####       ",

	// ========== Map 15 =========

	"#####         \n" +
	"#   ##        \n" +
	"#    #  ####  \n" +
	"# $  ####  #  \n" +
	"#  $$ $   $#  \n" +
	"###@ #$    ## \n" +
	" #  ##  $ $ ##\n" +
	" # $  ## ## .#\n" +
	" #  #$##$  #.#\n" +
	" ###   $..##.#\n" +
	"  #    #.*...#\n" +
	"  # $$ #.....#\n" +
	"  #  #########\n" +
	"  #  #        \n" +
	"  ####        ",

	// ========== Map 16 =========

	"       #######    \n" +
	" #######     #    \n" +
	" #     # $@$ #    \n" +
	" #$$ #   #########\n" +
	" # ###......##   #\n" +
	" #   $......## # #\n" +
	" # ###......     #\n" +
	"##   #### ### #$##\n" +
	"#  #$   #  $  # # \n" +
	"#  $ $$$  # $## # \n" +
	"#   $ $ ###$$ # # \n" +
	"#####     $   # # \n" +
	"    ### ###   # # \n" +
	"      #     #   # \n" +
	"      ########  # \n" +
	"             #### ",

	// ========== Map 17 =========

	"      ############    \n" +
	"      #  .  ##   #    \n" +
	"      # #.     @ #    \n" +
	" ###### ##...# ####   \n" +
	"##  ##...####     ####\n" +
	"# $ ##...    $ #  $  #\n" +
	"#     .. ## # ## ##  #\n" +
	"####$###$# $  #   # ##\n" +
	" ###  #    ##$ $$ # # \n" +
	" #   $$ # # $ # $## # \n" +
	" #                  # \n" +
	" #################  # \n" +
	"                 #### ",

	// ========== Map 18 =========

	"        ######              \n" +
	"        #   @####           \n" +
	"      ##### $   #           \n" +
	"      #   ##    ####        \n" +
	"      # $##  ##    #        \n" +
	"      #   #  ##### #        \n" +
	"      # #$$ $    # #        \n" +
	"      #  $ $ ### # #        \n" +
	"      # #   $  # # #        \n" +
	"      # #  #$#   # #        \n" +
	"     ## ####   # # #        \n" +
	"     #  $  ##### # # ####   \n" +
	"    ##    $     $  ###  ####\n" +
	"#####  ### $ $# $ #   .....#\n" +
	"#     ##      #  ##  #.....#\n" +
	"# $$$$    ######$##   #.##.#\n" +
	"##    ##              #....#\n" +
	" ##  ###############   ....#\n" +
	"  #  #             #####  ##\n" +
	"  ####                 #### ",

	// ========== Map 19 =========

	"       ############ \n" +
	"       #..........# \n" +
	"     ###.#.#.#.#..# \n" +
	"     #   .........# \n" +
	"     #@ $ $ $ *.*.# \n" +
	"    ####### ####### \n" +
	" ####   #    ##  #  \n" +
	"##    $ #    # $ ## \n" +
	"#  #$# ### ###$   ##\n" +
	"# $  $ $   # $ $ $ #\n" +
	"#  # $ ##       #$ #\n" +
	"#   $####$####$##  #\n" +
	"####  ##   #    #  #\n" +
	"   #$ ##   # # $$  #\n" +
	"   #   # $ #  $    #\n" +
	"   ### # $$ #  $ ###\n" +
	"     # #    # $ ##  \n" +
	"     # ######## #   \n" +
	"     #          #   \n" +
	"     ############   ",

	// ========== Map 20 =========


	"   ##########   \n" +
	"   #..  #   #   \n" +
	"   #..      #   \n" +
	"   #..  #  #### \n" +
	"  #######  #  ##\n" +
	"  #            #\n" +
	"  #  #  ##  #  #\n" +
	"#### ##  #### ##\n" +
	"#  $  ##### #  #\n" +
	"# # $  $  # $  #\n" +
	"# @$  $   #   ##\n" +
	"#### ## ####### \n" +
	"   #    #       \n" +
	"   ######       ",

	// ========== Map 21 =========

	"            ####      \n" +
	" ############  #####  \n" +
	" #    #  #  $  #   ## \n" +
	" # $ $ $  $ # $ $   # \n" +
	" ##$ $   # @# $   $ # \n" +
	"###   ############ ## \n" +
	"#  $ $#  #......# $#  \n" +
	"# #   #  #......## #  \n" +
	"#  ## ## # .....#  #  \n" +
	"# #      $...... $ #  \n" +
	"# # $ ## #......#  #  \n" +
	"#  $ $#  #......# $#  \n" +
	"# $   #  ##$#####  #  \n" +
	"# $ $ #### $ $  $ $#  \n" +
	"## #     $ $ $ $   ###\n" +
	" #  ###### $    $    #\n" +
	" #         # ####### #\n" +
	" ####### #$          #\n" +
	"       #   ###########\n" +
	"       #####          ",

	// ========== Map 22 =========

	"       #######           \n" +
	"       #  #  ####        \n" +
	"       # $#$ #  ##       \n" +
	"########  #  #   ########\n" +
	"#....  # $#$ #  $#  #   #\n" +
	"#....# #     #$  #      #\n" +
	"#..#.    $#  # $    #$  #\n" +
	"#... @##  #$ #$  #  #   #\n" +
	"#.... ## $#     $########\n" +
	"########  #$$#$  #       \n" +
	"       # $#  #  $#       \n" +
	"       #  #  #   #       \n" +
	"       ####  #####       \n" +
	"          ####           ",

	// ========== Map 23 =========

	"   ##########        \n" +
	"   #........####     \n" +
	"   #.#.#....#  #     \n" +
	"   #........$$ #     \n" +
	"   #     .###  ####  \n" +
	" #########  $ #   #  \n" +
	" #     $   $ $  $ #  \n" +
	" #  #    #  $ $#  #  \n" +
	" ## #####   #  #  #  \n" +
	" # $     #   #### #  \n" +
	"##  $#   # ##  #  #  \n" +
	"#    ##$###    #  ## \n" +
	"# $    $ #  #  #   # \n" +
	"#####    # ## # ## ##\n" +
	"    #$# #  $  $ $   #\n" +
	"    #@#  $#$$$  #   #\n" +
	"    ###  $      #####\n" +
	"      ##  #  #  #    \n" +
	"       ##########    ",

	// ========== Map 24 =========

	"               ####    \n" +
	"          ######  #####\n" +
	"    #######       #   #\n" +
	"    #      $ $ ## # # #\n" +
	"    #  #### $  #     .#\n" +
	"    #      $ # # ##.#.#\n" +
	"    ##$####$ $ $ ##.#.#\n" +
	"    #     #    ####.###\n" +
	"    # $   ######  #.#.#\n" +
	"######$$$##      @#.#.#\n" +
	"#      #    #$#$###. .#\n" +
	"# #### #$$$$$    # ...#\n" +
	"# #    $     #   # ...#\n" +
	"# #   ## ##     ###...#\n" +
	"# ######$######  ######\n" +
	"#        #    #  #     \n" +
	"##########    ####     ",

	// ========== Map 25 =========

	"#########      \n" +
	"#       #      \n" +
	"#       ####   \n" +
	"## #### #  #   \n" +
	"## #@##    #   \n" +
	"# $$$ $  $$#   \n" +
	"#  # ## $  #   \n" +
	"#  # ##  $ ####\n" +
	"####  $$$ $#  #\n" +
	" #   ##   ....#\n" +
	" # #   # #.. .#\n" +
	" #   # # ##...#\n" +
	" ##### $  #...#\n" +
	"     ##   #####\n" +
	"      #####    ",

	// ========== Map 26 =========

	" #################     \n" +
	" #...   #    #   ###   \n" +
	"##.....  $## # # $ #   \n" +
	"#......#  $  #  $  #   \n" +
	"#......#  #  # # # ##  \n" +
	"######### $  $ # #  ###\n" +
	"  #     #$##$ ## ##   #\n" +
	" ##   $    # $  $   # #\n" +
	" #  ## ### #  #####$# #\n" +
	" # $ $$     $   $     #\n" +
	" # $    $##$ ######## #\n" +
	" #######  @ ##      ###\n" +
	"       ######          ",

	// ========== Map 27 =========

	"     #######   \n" +
	"     #@ #  #   \n" +
	"     # $   #   \n" +
	"    ### ## #   \n" +
	" #### $  # ##  \n" +
	" #       #  ## \n" +
	" # $ $#### $ # \n" +
	" # $$ #  #  $# \n" +
	" #$  $   #$  # \n" +
	"##  $$#   $$ ##\n" +
	"# $$  #  #  $ #\n" +
	"#     #### $  #\n" +
	"#  #$##..##   #\n" +
	"### .#....#####\n" +
	"  # .......##  \n" +
	"  #....   ..#  \n" +
	"  ###########  ",

	// ========== Map 28 =========

	"                #####   \n" +
	"       ###### ###   ####\n" +
	"   #####    ### $ $  $ #\n" +
	"####  ## #$ $    $ #   #\n" +
	"#....   $$ $ $  $   #$##\n" +
	"#.. # ## #   ###$## #  #\n" +
	"#....    # ###    #    #\n" +
	"#....    # ##  $  ###$ #\n" +
	"#..######  $  #  #### ##\n" +
	"####    #   ###    @  # \n" +
	"        ############### ",

	// ========== Map 29 =========

	" #####        \n" +
	" #   #######  \n" +
	" # $ ###   #  \n" +
	" # $    $$ #  \n" +
	" ## ####   #  \n" +
	"### #  # ###  \n" +
	"#   #  #@##   \n" +
	"# $$    $ #   \n" +
	"#   # # $ ####\n" +
	"##### #   #  #\n" +
	" #   $####   #\n" +
	" #  $     $  #\n" +
	" ##   ##### ##\n" +
	" ##########  #\n" +
	"##....# $  $ #\n" +
	"#.....# $$#  #\n" +
	"#.. ..# $  $ #\n" +
	"#.....$   #  #\n" +
	"##  ##########\n" +
	" ####         ",

	// ========== Map 30 =========

	" #######       \n" +
	" #  #  #####   \n" +
	"##  #  #...### \n" +
	"#  $#  #...  # \n" +
	"# $ #$$ ...  # \n" +
	"#  $#  #... .# \n" +
	"#   # $########\n" +
	"##$       $ $ #\n" +
	"##  #  $$ #   #\n" +
	" ######  ##$$@#\n" +
	"      #      ##\n" +
	"      ######## ",

	// ========== Map 31 =========

	"  ####            \n" +
	"  #  #########    \n" +
	" ##  ## @#   #    \n" +
	" #  $# $ $   #### \n" +
	" #$  $  # $ $#  ##\n" +
	"##  $## #$ $     #\n" +
	"#  #  # #   $$$  #\n" +
	"# $    $  $## ####\n" +
	"# $ $ #$#  #  #   \n" +
	"##  ###  ###$ #   \n" +
	" #  #....     #   \n" +
	" ####......####   \n" +
	"   #....####      \n" +
	"   #...##         \n" +
	"   #...#          \n" +
	"   #####          ",

	// ========== Map 32 =========

	"      ####   \n" +
	"  #####  #   \n" +
	" ##     $#   \n" +
	"## $  ## ### \n" +
	"#@$ $ # $  # \n" +
	"#### ##   $# \n" +
	" #....#$ $ # \n" +
	" #....#   $# \n" +
	" #....  $$ ##\n" +
	" #... # $   #\n" +
	" ######$ $  #\n" +
	"      #   ###\n" +
	"      #$ ### \n" +
	"      #  #   \n" +
	"      ####   ",

	// ========== Map 33 =========

	"############\n" +
	"##     ##  #\n" +
	"##   $   $ #\n" +
	"#### ## $$ #\n" +
	"#   $ #    #\n" +
	"# $$$ # ####\n" +
	"#   # # $ ##\n" +
	"#  #  #  $ #\n" +
	"# $# $#    #\n" +
	"#   ..# ####\n" +
	"####.. $ #@#\n" +
	"#.....# $# #\n" +
	"##....#  $ #\n" +
	"###..##    #\n" +
	"############",

	// ========== Map 34 =========

	"############  ######\n" +
	"#   #    #@####....#\n" +
	"#   $$#       .....#\n" +
	"#   # ###   ## ....#\n" +
	"## ## ###  #   ....#\n" +
	" # $ $     # ## ####\n" +
	" #  $ $##  #       #\n" +
	"#### #  #### ## ## #\n" +
	"#  # #$   ## ##    #\n" +
	"# $  $  # ## #######\n" +
	"# # $ $    # #      \n" +
	"#  $ ## ## # #      \n" +
	"# $$     $$  #      \n" +
	"## ## ### $  #      \n" +
	" #    # #    #      \n" +
	" ###### ######      ",

	// ========== Map 35 =========

	"     ####         \n" +
	"   ###  ##        \n" +
	"####  $  #        \n" +
	"#   $ $  ####     \n" +
	"# $   # $   # ####\n" +
	"#  #  #   $ # #..#\n" +
	"##$#$ ####$####..#\n" +
	" #   ##### ## ...#\n" +
	" #$# ##@## ##  ..#\n" +
	" # #    $     ...#\n" +
	" #   #### ###  ..#\n" +
	" ### ## #  ## ...#\n" +
	"  ##$ ####$ ###..#\n" +
	"  #   ##    # #..#\n" +
	" ## $$##  $ # ####\n" +
	" #     $$$$ #     \n" +
	" # $ ###    #     \n" +
	" #   # ######     \n" +
	" #####            ",

	// ========== Map 36 =========

	"###########          \n" +
	"#......   #########  \n" +
	"#......   #  ##   #  \n" +
	"#..### $    $     #  \n" +
	"#... $ $ #  ###   #  \n" +
	"#...#$#####    #  #  \n" +
	"###    #   #$  # $###\n" +
	"  #  $$ $ $  $##  $ #\n" +
	"  #  $   #$#  ##    #\n" +
	"  ### ## #  $ #######\n" +
	"   #  $ $ ## ##      \n" +
	"   #    $  $  #      \n" +
	"   ##   # #   #      \n" +
	"    #####@#####      \n" +
	"        ###          ",

	// ========== Map 37 =========

	" #########    \n" +
	" #....   ##   \n" +
	" #.#.#  $ ##  \n" +
	"##....# # @## \n" +
	"# ....#  #  ##\n" +
	"#     #$ ##$ #\n" +
	"## ###  $    #\n" +
	" #$  $ $ $#  #\n" +
	" # #  $ $ ## #\n" +
	" #  ###  ##  #\n" +
	" #    ## ## ##\n" +
	" #  $ #  $  # \n" +
	" ###$ $   ### \n" +
	"   #  #####   \n" +
	"   ####       ",

	// ========== Map 38 =========

	"              ###      \n" +
	"             ##.###    \n" +
	"             #....#    \n" +
	" #############....#    \n" +
	"##   ##     ##....#####\n" +
	"#  $$##  $ @##....    #\n" +
	"#      $$ $#  ....#   #\n" +
	"#  $ ## $$ # #....#  ##\n" +
	"#  $ ## $  # ## ###  # \n" +
	"## ##### ###         # \n" +
	"##   $  $ ##### ###  # \n" +
	"# $###  # ##### # #### \n" +
	"#   $   #       #      \n" +
	"#  $ #$ $ $###  #      \n" +
	"# $$$# $   # ####      \n" +
	"#    #  $$ #           \n" +
	"######   ###           \n" +
	"     #####             ",

	// ========== Map 39 =========

	"      #### \n" +
	"####### @# \n" +
	"#     $  # \n" +
	"#   $## $# \n" +
	"##$#...# # \n" +
	" # $...  # \n" +
	" # #. .# ##\n" +
	" #   # #$ #\n" +
	" #$  $    #\n" +
	" #  #######\n" +
	" ####      ",

	// ========== Map 40 =========

	"           #####    \n" +
	"          ##   ##   \n" +
	"         ##     #   \n" +
	"        ##  $$  #   \n" +
	"       ## $$  $ #   \n" +
	"       # $    $ #   \n" +
	"####   #   $$ ##### \n" +
	"#  ######## ##    # \n" +
	"#..           $$$@# \n" +
	"#.# ####### ##   ## \n" +
	"#.# #######. #$ $###\n" +
	"#........... #   $ #\n" +
	"##############  $  #\n" +
	"             ##  ###\n" +
	"              ####  ",

	// ========== Map 41 =========

	" ########    \n" +
	" #@##   #### \n" +
	" # $   $   # \n" +
	" #  $ $ $$$# \n" +
	" # $$# #   # \n" +
	"##$    $   # \n" +
	"#  $  $$$$$##\n" +
	"# $#### #   #\n" +
	"#  $....#   #\n" +
	"# ##....#$$ #\n" +
	"# ##....   ##\n" +
	"#   ....#  # \n" +
	"## #....#$$# \n" +
	" # #....#  # \n" +
	" #         # \n" +
	" #### ##$### \n" +
	"    #    #   \n" +
	"    ######   ",

	// ========== Map 42 =========

	"    ############ \n" +
	"    #          ##\n" +
	"    #  # #$$ $  #\n" +
	"    #$ #$#  ## @#\n" +
	"   ## ## # $ # ##\n" +
	"   #   $ #$  # # \n" +
	"   #   # $   # # \n" +
	"   ## $ $   ## # \n" +
	"   #  #  ##  $ # \n" +
	"   #    ## $$# # \n" +
	"######$$   #   # \n" +
	"#....#  ######## \n" +
	"#.#... ##        \n" +
	"#....   #        \n" +
	"#....   #        \n" +
	"#########        ",

	// ========== Map 43 =========

	"      ######             \n" +
	"   #####   #             \n" +
	"   #   # # #####         \n" +
	"   # $ #  $    ######    \n" +
	"  ##$  ### ##       #    \n" +
	"###  $$ $ $ #  ##   #####\n" +
	"#       $   ###### ##   #\n" +
	"#  ######## #@   # #  # #\n" +
	"## ###      #### #$# #  #\n" +
	" # ### #### ##.. #   $ ##\n" +
	" #  $  $  #$##.. #$##  ##\n" +
	" #  # # #     ..## ## $ #\n" +
	" ####   # ## #..#    $  #\n" +
	"    #####    #..# # #  ##\n" +
	"        ######..#   # ## \n" +
	"             #..#####  # \n" +
	"             #..       # \n" +
	"             ##  ###  ## \n" +
	"              #########  ",

	// ========== Map 44 =========

	"        #######    \n" +
	"    #####  #  #### \n" +
	"    #   #   $    # \n" +
	" #### #$$ ## ##  # \n" +
	"##      # #  ## ###\n" +
	"#  ### $#$  $  $  #\n" +
	"#...    # ##  #   #\n" +
	"#...#    @ # ### ##\n" +
	"#...#  ###  $  $  #\n" +
	"######## ##   #   #\n" +
	"          #########",

	// ========== Map 45 =========

	"    #########  ####   \n" +
	"    #   ##  ####  #   \n" +
	"    #   $   #  $  #   \n" +
	"    #  # ## #     ####\n" +
	"    ## $   $ $$# #   #\n" +
	"    ####  #  # $ $   #\n" +
	"#####  ####    ###...#\n" +
	"#   #$ #  # ####.....#\n" +
	"#      #  # # ##.....#\n" +
	"###### #  #$   ###...#\n" +
	"   #   ## # $#   #...#\n" +
	"  ##       $  $# #####\n" +
	" ## $$$##  # $   #    \n" +
	" #   #  # ###  ###    \n" +
	" #   $  #$ @####      \n" +
	" #####  #   #         \n" +
	"     ########         ",

	// ========== Map 46 =========

	" #####             \n" +
	" #   #             \n" +
	" # # ######        \n" +
	" #      $@######   \n" +
	" # $ ##$ ###   #   \n" +
	" # #### $    $ #   \n" +
	" # ##### #  #$ ####\n" +
	"##  #### ##$      #\n" +
	"#  $#  $  # ## ## #\n" +
	"#         # #...# #\n" +
	"######  ###  ...  #\n" +
	"     #### # #...# #\n" +
	"          # ### # #\n" +
	"          #       #\n" +
	"          #########",

	// ========== Map 47 =========

	"       ####     \n" +
	"       #  ##    \n" +
	"       #   ##   \n" +
	"       # $$ ##  \n" +
	"     ###$  $ ## \n" +
	"  ####    $   # \n" +
	"###  # #####  # \n" +
	"#    # #....$ # \n" +
	"# #   $ ....# # \n" +
	"#  $ # #.*..# # \n" +
	"###  #### ### # \n" +
	"  #### @$  ##$##\n" +
	"     ### $     #\n" +
	"       #  ##   #\n" +
	"       #########",

	// ========== Map 48 =========

	"      ############ \n" +
	"     ##..    #   # \n" +
	"    ##..* $    $ # \n" +
	"   ##..*.# # #$ ## \n" +
	"   #..*.# # # $  # \n" +
	"####...#  #    # # \n" +
	"#  ## #          # \n" +
	"# @$ $ ###  # # ## \n" +
	"# $   $   # #   #  \n" +
	"###$$   # # # # #  \n" +
	"  #   $   # # #####\n" +
	"  # $# #####      #\n" +
	"  #$   #   #   #  #\n" +
	"  #  ###   ##     #\n" +
	"  #  #      #    ##\n" +
	"  ####      ###### ",

	// ========== Map 49 =========

	"     #############   \n" +
	"     #    ###    #   \n" +
	"     #     $ $  #### \n" +
	"   #### #   $ $    # \n" +
	"  ## $  #$#### $ $ # \n" +
	"###   # #   ###  $ # \n" +
	"# $  $  #  $  # #### \n" +
	"# ##$#### #$#  $  ###\n" +
	"# ##  ### # # #  $  #\n" +
	"#    @$   $   # $ # #\n" +
	"#####  #  ##  # $#  #\n" +
	"  #... #####$  #  # #\n" +
	"  #.......# $$ #$ # #\n" +
	"  #.......#         #\n" +
	"  #.......#######  ##\n" +
	"  #########     #### ",

	// ========== Map 50 =========

	"##### ####      \n" +
	"#...# #  ####   \n" +
	"#...###  $  #   \n" +
	"#....## $  $### \n" +
	"##....##   $  # \n" +
	"###... ## $ $ # \n" +
	"# ##    #  $  # \n" +
	"#  ## # ### ####\n" +
	"# $ # #$  $    #\n" +
	"#  $ @ $    $  #\n" +
	"#   # $ $$ $ ###\n" +
	"#  ######  ###  \n" +
	"# ##    ####    \n" +
	"###             ",

	// ========== Map 51 =========

	" ####                \n" +
	"##  #####            \n" +
	"#       # #####      \n" +
	"# $###  ###   #      \n" +
	"#..#  $# #  # #      \n" +
	"#..#      $$# ###    \n" +
	"#.*# #  #$ $    #####\n" +
	"#..#  ##     ##$#   #\n" +
	"#.*$  $ # ##  $     #\n" +
	"#..##  $   #   ######\n" +
	"#.*##$##   #####     \n" +
	"#..  $ #####         \n" +
	"#  # @ #             \n" +
	"########             ",

	// ========== Map 52 =========

	"   ##########\n" +
	"   #  ###   #\n" +
	"   # $   $  #\n" +
	"   #  ####$##\n" +
	"   ## #  #  #\n" +
	"  ##  #.*   #\n" +
	"  #  ##..#  #\n" +
	"  # @ #.*# ##\n" +
	"  # #$#..#$ #\n" +
	"  # $ #..#  #\n" +
	"  # # #**#  #\n" +
	"  # $ #..#$##\n" +
	"  #    .*#  #\n" +
	" ###  #  #  #\n" +
	"##    ####  #\n" +
	"#  #######$##\n" +
	"# $      $  #\n" +
	"#  ##   #   #\n" +
	"#############",

	// ========== Map 53 =========

	" ##################### \n" +
	" #   ##  #   #   #   # \n" +
	" # $     $   $   $   ##\n" +
	"##### #  #   ### ##$###\n" +
	"#   # ##$######   #   #\n" +
	"# $   # ......#   # $ #\n" +
	"## #  # ......#####   #\n" +
	"## #########..#   # ###\n" +
	"#          #..# $   #  \n" +
	"# ## ### ###..## #  ###\n" +
	"# #   #   ##..## ###  #\n" +
	"#   @      $..#       #\n" +
	"# #   #   ##  #   ##  #\n" +
	"##### ############## ##\n" +
	"#          #   #    $ #\n" +
	"# $  # $ $ $   # #    #\n" +
	"# #$## $#  ## ##    # #\n" +
	"#  $ $$ #### $  $ # # #\n" +
	"#          #   #      #\n" +
	"#######################",

	// ========== Map 54 =========

	" #####################\n" +
	"##                   #\n" +
	"#    $ #      ## #   #\n" +
	"#  ###### ###  #$## ##\n" +
	"##$#   ##$#....   # # \n" +
	"#  #    $ #....## # # \n" +
	"# $ # # # #....##   # \n" +
	"# $ #$$   #....##$# # \n" +
	"# # $@$##$#....##   # \n" +
	"#   $$$   #....#    # \n" +
	"#  $#   # ###### $### \n" +
	"##  # ###$$  $   $ #  \n" +
	"##     # $  $ ##   #  \n" +
	" #####   #   #######  \n" +
	"     #########        ",

	// ========== Map 55 =========

	"##########    \n" +
	"#        #### \n" +
	"# ###### #  ##\n" +
	"# # $ $ $  $ #\n" +
	"#       #$   #\n" +
	"###$  $$#  ###\n" +
	"  #  ## # $## \n" +
	"  ##$#   $ @# \n" +
	"   #  $ $ ### \n" +
	"   # #   $  # \n" +
	"   # ##   # # \n" +
	"  ##  ##### # \n" +
	"  #         # \n" +
	"  #.......### \n" +
	"  #.......#   \n" +
	"  #########   ",

	// ========== Map 56 =========

	"         ####     \n" +
	" #########  ##    \n" +
	"##  $      $ #####\n" +
	"#   ## ##   ##...#\n" +
	"# #$$ $ $$#$##...#\n" +
	"# #    @  #   ...#\n" +
	"#  $# ###$$   ...#\n" +
	"# $  $$  $ ##....#\n" +
	"###$       #######\n" +
	"  #  #######      \n" +
	"  ####            ",

	// ========== Map 57 =========

	"              ######       \n" +
	"          #####    #       \n" +
	"          #  ## #  #####   \n" +
	"          #   *.#..#   #   \n" +
	" ##### #### $#.#...    #   \n" +
	" #   ###  ## #*....## ##   \n" +
	" # $      ## #..#..## #    \n" +
	"###### #   # #*.##### #    \n" +
	"#   # $#$# # #..##### #    \n" +
	"# $  $     # #*.    # #    \n" +
	"## ##  $ ### #  ##  # #    \n" +
	" #  $  $ ### ##### ## #    \n" +
	" ###$###$###  #### ## #    \n" +
	"#### #         ###  # #    \n" +
	"#  $ #  $####  ###$$#@#####\n" +
	"#      $ # #  ####  #$#   #\n" +
	"#### #  $# #              #\n" +
	"   #  $  # ##  ##  ########\n" +
	"   ##  ###  ########       \n" +
	"    ####                   ",

	// ========== Map 58 =========

	"         ####                \n" +
	"         #  #                \n" +
	"         #  ########         \n" +
	"   #######  #      #         \n" +
	"   #   # # # # #   ##        \n" +
	"   # $     $  ##  $ #        \n" +
	"  ### $# #  # #     #########\n" +
	"  #  $  #  $# # $$ #   # #  #\n" +
	" ## #   #     ###    $ # #  #\n" +
	" #  #$   # ###  #  # $$# #  #\n" +
	" #    $## $  #   ## $  # # ##\n" +
	"####$ $ #    ##  #   $    ..#\n" +
	"#  #    ### # $ $ ###  ###.*#\n" +
	"#     ##  $$ @  $     ##....#\n" +
	"#  ##  ##   $  #$#  ##....*.#\n" +
	"## #  $  # # $##  ##....*.###\n" +
	"## ##  $  # $ #  #....*.###  \n" +
	"#    $ ####   # ....*.###    \n" +
	"#   #  #  #  #  ..*.###      \n" +
	"########  ###########        ",

	// ========== Map 59 =========

	"        #####             \n" +
	"        #   ####          \n" +
	"        # $    ####  #### \n" +
	"        #   # $#  ####  # \n" +
	"########### #   $   #   # \n" +
	"#..     # $  #### #  #  # \n" +
	"#..$  #   $  #  $ # $ .## \n" +
	"#.*# # $ $ ##  ##    #.#  \n" +
	"#..#$ @ #   ##    $$ #.#  \n" +
	"#..# $ $  $ $ ##   ## .#  \n" +
	"#.*$$ # ##   $ #$# $ #.#  \n" +
	"#..#      ##   #     #.#  \n" +
	"#..#######  ### ######.## \n" +
	"# $$                  *.##\n" +
	"#  ##################  ..#\n" +
	"####                ######"
];