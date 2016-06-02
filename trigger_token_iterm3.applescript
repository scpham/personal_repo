tell application "System Events"
    set oldcb to the clipboard
    #tell process "SofToken II" to click button "Go" of window "SofToken II"
    -- set the clipboard to (do shell script "~/bin/get_softoken")
    set token to do shell script "~/bin/get_softoken"
    -- set the clipboard to token
end tell

tell application "iTerm2"
  set _session to ( current session of current window )
  tell _session
    repeat 10 times
      set pw to contents of ( _session )
      set deLimitedList to paragraphs of pw
      set last_line to ""
      repeat with this_item in deLimitedList
        if this_item as string is not equal to "" then
          set last_line to this_item
        end if
      end repeat
      if "assword:" is in last_line or "esponse" is in last_line then
        delay 2
        write text (token)
        exit repeat
      else if "(yes/no)?" is in last_line then
        write text "yes"
      end if
      delay 1
    end repeat
  end tell
end tell
