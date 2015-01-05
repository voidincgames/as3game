package 
{
 import net.flashpunk.Engine;
 import net.flashpunk.FP;
 import worlds.GameWorld;
 [SWF(width="480", height="240")]
 
	/**
	 * ...
	 * @author Cloud_Inc
	 */
	public class Main extends Engine
	{
		
		public function Main():void 
		{
		super(480, 240);
		}
		
		override public function init():void 
		{
			super.init();
			FP.world = new GameWorld();
					
			
		}
		
	}
	
}