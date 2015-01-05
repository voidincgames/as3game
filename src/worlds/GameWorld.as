package worlds 
	{
		
	
	import net.flashpunk.graphics.Text;
	import net.flashpunk.World
	import net.flashpunk.FP;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import entities.Player;
	import entities.Coin;
	/**
	 * ...
	 * @author Cloud_Inc
	 */
	public class GameWorld extends World 
	{
		private var xInput:int = 0;
		private var yInput:int = 0;
		
		protected var _player:Player;
	
		private var _coinsgotten:uint;
		private var _cointext:Text;
		protected var _timeLeft:Number;
		
		
		protected static const MIN_SPAWN_RATE:Number = 0.5;
		protected static const MAX_SPAWN_RATE:Number = 2;
		
		[Embed(source = "../../lib/assets/fonts/Minecraftia-Regular.ttf", embedAsCFF = "false", fontFamily = "pixel")]
		public static const FONT_ART:Class;
	
		
		override public function begin():void
		{
			
			_player = new Player();
			add(_player)
			
			_cointext = new Text("0", 10, 10);
			_cointext.font = "pixel";
			addGraphic(_cointext);
			super.begin();
			
			
			
		}	
		public function GameWorld() 
		{
			_timeLeft = 1;
		}
		
		override public function update():void
		{
			updateSpawn();
			
			var collisionCoin:Coin = Coin(_player.collideTypes("coin", _player.x, _player.y));
			
			if (collisionCoin != null)
			{
				recycle(collisionCoin);
				_coinsgotten++;
				_cointext.text = _coinsgotten.toString();
			}
			
			super.update();
		
		}
		
			protected function updateSpawn():void
		{
			_timeLeft -= FP.elapsed;
			
			if (_timeLeft <= 0)
			{	
				create(Coin, true);
				_timeLeft += FP.random * (MAX_SPAWN_RATE - MIN_SPAWN_RATE) + MIN_SPAWN_RATE;
			}
		}
	}
}