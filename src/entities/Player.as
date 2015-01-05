package entities 
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.Mask;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	/**
	 * ...
	 * @author Cloud_Inc
	 */
	public class Player extends Entity 
	{
		
		[Embed(source="../../lib/assets/images/player.png")]
		private const PLAYER:Class;

		
		public var sprPlayer:Spritemap = new Spritemap(PLAYER, 32, 32);
		
		static public const MAX_SPEED:Number = 180;
	
		
		public function Player() 
		{
			graphic = sprPlayer;
			sprPlayer.add("idle", [0], 0, false)
			sprPlayer.add("wdown", [0, 1, 2, 3], 15, true)
			sprPlayer.add("wright", [4, 5, 6, 7], 15, true)
			sprPlayer.add("wup", [8,9,10,11], 15, true)
			sprPlayer.add("wleft", [12, 13, 14, 15], 15, true)
			
			Input.define("Up", Key.W);
			Input.define("Down", Key.S);
			Input.define("Left", Key.A);
			Input.define("Right", Key.D);
			setHitbox(16, 32, -8, 0);
			
			type = "player";
		}
		
		override public function update():void
		{
			
			var xInput:int = 0;
			var yInput:int = 0;
			
			if (Input.check("Left")) {
				xInput--;
				sprPlayer.play("wleft");
			}
			if (Input.check("Right")) {
				xInput++;
				sprPlayer.play("wright");
			}
			if (Input.check("Up")) {
				yInput--;
				sprPlayer.play("wup");
			}
			if (Input.check("Down")) {
				yInput++;
				sprPlayer.play("wdown");
			}
		
			if (Input.released("Right")) sprPlayer.setFrame(0, 1);
			if (Input.released("Left")) sprPlayer.setFrame(0, 3);
			if (Input.released("Down")) sprPlayer.setFrame(0, 4);
			if (Input.released("Up")) sprPlayer.setFrame(0, 2);
			
			this.x += MAX_SPEED * FP.elapsed * xInput;
			this.y += MAX_SPEED * FP.elapsed * yInput;
			
			
			
			super.update();
			
			
		}
			
		
			
		
		
	}

}