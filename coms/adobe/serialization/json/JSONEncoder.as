package coms.adobe.serialization.json
{
   import flash.utils.*;
   
   public class JSONEncoder
   {
       
      
      private var jsonString:String;
      
      public function JSONEncoder(param1:*)
      {
         super();
         this.jsonString = this.convertToString(param1);
      }
      
      public function getString() : String
      {
         return this.jsonString;
      }
      
      private function convertToString(param1:*) : String
      {
         if(param1 is String)
         {
            return this.escapeString(param1 as String);
         }
         if(param1 is Number)
         {
            return !isFinite(param1 as Number) ? "null" : param1.toString();
         }
         if(param1 is Boolean)
         {
            return !param1 ? "false" : "true";
         }
         if(param1 is Array)
         {
            return this.arrayToString(param1 as Array);
         }
         if(param1 is Object && param1 != null)
         {
            return this.objectToString(param1);
         }
         return "null";
      }
      
      private function escapeString(param1:String) : String
      {
         var _loc2_:String = null;
         var _loc3_:String = null;
         var _loc4_:String = null;
         var _loc7_:int = 0;
         var _loc5_:* = "";
         var _loc6_:Number = param1.length;
         while(_loc7_ < _loc6_)
         {
            _loc2_ = param1.charAt(_loc7_);
            switch(_loc2_)
            {
               case "\"":
                  _loc5_ += "\\\"";
                  break;
               case "\\":
                  _loc5_ += "\\\\";
                  break;
               case "\b":
                  _loc5_ += "\\b";
                  break;
               case "\f":
                  _loc5_ += "\\f";
                  break;
               case "\n":
                  _loc5_ += "\\n";
                  break;
               case "\r":
                  _loc5_ += "\\r";
                  break;
               case "\t":
                  _loc5_ += "\\t";
                  break;
               default:
                  if(_loc2_ < " ")
                  {
                     _loc3_ = _loc2_.charCodeAt(0).toString(16);
                     _loc4_ = _loc3_.length == 2 ? "00" : "000";
                     _loc5_ += "\\u" + _loc4_ + _loc3_;
                  }
                  else
                  {
                     _loc5_ += _loc2_;
                  }
                  break;
            }
            _loc7_++;
         }
         return "\"" + _loc5_ + "\"";
      }
      
      private function arrayToString(param1:Array) : String
      {
         var _loc4_:int = 0;
         var _loc2_:* = "";
         var _loc3_:int = param1.length;
         while(_loc4_ < _loc3_)
         {
            if(_loc2_.length > 0)
            {
               _loc2_ += ",";
            }
            _loc2_ += this.convertToString(param1[_loc4_]);
            _loc4_++;
         }
         return "[" + _loc2_ + "]";
      }
      
		private function objectToString( o:Object ):String
		{
			var s:String = "";
			var classInfo:XML = describeType( o );
			if ( classInfo.@name.toString() == "Object" )
			{
				var value:Object;
				for ( var key:String in o )
				{
					value = o[key];
					if ( value is Function )
					{
						continue;
					}
					if ( s.length > 0 ) {
						s += ","
					}					
					s += escapeString( key ) + ":" + convertToString( value );
				}
			}
			else // o is a class instance
			{
				for each ( var v:XML in classInfo..*.( 
					name() == "variable"
					||
					( 
						name() == "accessor"
						// Issue #116 - Make sure accessors are readable
						&& attribute( "access" ).charAt( 0 ) == "r" ) 
					) )
				{
					if ( v.metadata && v.metadata.( @name == "Transient" ).length() > 0 )
					{
						continue;
					}
					if ( s.length > 0 ) {
						s += ","
					}					
					s += escapeString( v.@name.toString() ) + ":" 
							+ convertToString( o[ v.@name ] );
				}				
			}
			return "{" + s + "}";
		}
   }
}
