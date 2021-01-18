------------------------------------------------
-- Sample App : wrap.lua example
-- This is the same example code from wrap.lua
-- It should work just like the original script
------------------------------------------------

-- Define a global script object with event handlers
script = {}

function script.onStart ()
  -- Display some text
  screen.setCenteredText("script started")

  -- Create some timers to show that the script is working
  unit.setTimer("a", 2) -- timer id "a", ticks every 2 seconds
  unit.setTimer("b", 3) -- timer id "b", ticks every 3 seconds
end

function script.onStop ()
  screen.setCenteredText("script stopped")
end

function script.onActionStart (actionName)
  screen.setCenteredText(actionName .. " key pressed")
end

function script.onActionStop (actionName)
  screen.setCenteredText(actionName .. " key released")
end

function script.onTick (timerId)
  screen.setCenteredText("timer " .. timerId .. " ticked")
end

-- Other events that are available by default:
-- * onActionLoop(actionName): action key is held
-- * onUpdate(): executed once per frame
-- * onFlush(): executed 60 times per second, for physics calculations only; setEngineCommand must be called from here

-- Slot events are available if slot type is set with the --slot command line option.
function script.onMouseDown (x, y)
  screen.setCenteredText("mouse down: x=" .. x .. " , y=" .. y)
end

-- Call the start event handler
-- Alternatively, initialization code can be placed anywhere in this file.
-- The only requirement is that there is a global "script" object with event handlers
script.onStart()