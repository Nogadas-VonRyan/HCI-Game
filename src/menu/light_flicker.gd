extends OmniLight3D

@onready var random = RandomNumberGenerator.new()
@export var range: int
# Called when the node enters the scene tree for the first time.
func _ready():
	random.randomize()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var rand = randi_range(0,100)
	if rand > range:
		visible = not visible
