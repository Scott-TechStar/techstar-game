require 'ruby2d'

set width: 1024
set height: 597
WALK_SPEED = 3
background = Image.new('techstarfield.jpg')
scott = Sprite.new(
    'scott.png',
    width: 256,
    height: 256,
    clip_width:256,
    x: 0,
    y: 300
)


on :key_held do |action|
    case action.key
    when 'left'
        scott.play flip: :horizontal

        if scott.x > 0
            scott.x -=WALK_SPEED
        else
            if background.x < 0
                background.x +=WALK_SPEED
            end        
        end    
    when 'right'        
        scott.play
    
       if  scott.x < (Window.width - scott.width)
            scott.x +=WALK_SPEED
       else
           puts "backgroud.x: #{background.x}"
           puts "backgroud.width: #{background.width}"
           if (background.x - Window.width) > -background.width
              background.x -=WALK_SPEED
            end       
       end  
    end
end    
on :key_up do
    scott.stop
end    
show