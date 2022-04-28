-- Gets screen resolution
local w, h = getResolution()

-- Creates layer
local layer = createLayer()

-- Gets font
local font = loadFont('Play', math.min(w, h) * 0.1)

-- Draws "Hello, World!" centered
setNextFillColor(layer, 2, 1, 0, 1)
setNextTextAlign(layer, AlignH_Center, AlignV_Middle)
addText(layer, font, 'Hello, World!', w / 2, h / 2)