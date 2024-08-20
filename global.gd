extends Node

var currentResolution = Vector2i(1152,648)

var lastHighScore = 0;
var score = 0
var windowMode = 1
var selectedResolution = 0

var SCALE_MAX_WEIGHT : int = 75;

var highest_left_block_position = -INF;
var highest_right_block_position = -INF;

var isFullscreen = true

var VOLUME_ARRAY : Array = [1,1,1]
