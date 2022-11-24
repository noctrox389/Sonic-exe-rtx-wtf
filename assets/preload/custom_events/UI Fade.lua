function onEvent(name, v1, v2)
	if name == 'UI Fade' then
            local easing = 'linear'
            local duration = 1
            local target = 0
            
            local commaStart = 0
            local commaEnd = 0

            target = tonumber(v1)
            if string.find(v1,',',0,true) ~= nil then
                  commaStart,commaEnd = string.find(v2,',',0,true)
                  easing = string.sub(v2,commaEnd + 1)
                  duration = tonumber(string.sub(v2,0,commaEnd - 1))
            else
                  duration = tonumber(v2)
            end
            if duration ~= 0 then
                  for strumLineLength = 0,7 do
                        noteTweenAlpha('byeNotes'..strumLineLength, strumLineLength, target, duration, easing);
                  end
                  doTweenAlpha('hpBar', 'healthBar', target, duration, easing)
                  doTweenAlpha('hpicon1', 'iconP1', target, duration,easing)
                  doTweenAlpha('hpicon2', 'iconP2', target, duration, easing)
                  doTweenAlpha('score', 'scoreTxt', target, duration, easing)
                  doTweenAlpha('timeBar', 'timeBar', target, duration, easing)
                  doTweenAlpha('timeBarTxt', 'timeTxt', target, duration, easing)
            else
                  for strumLineLength = 0,7 do
                        setPropertyFromGroup('strumLineNotes', strumLineLength, target);
                  end
                  setProperty('healthBar.alpha', target)
                  setProperty('iconP1.alpha', target)
                  setProperty('iconP2.alpha', target)
                  setProperty('scoreTxt.alpha', target)
                  setProperty('timeBar.alpha', target)
                  setProperty('timeTxt.alpha', target)
            end

	end
end