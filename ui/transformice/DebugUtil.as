package ui.transformice
{
    public class DebugUtil 
    {

        // Get stack trace as an array with optional filtering
        public static function getStackTrace(skipFromTop:int=0, skipFromBottom:int=0):Array // _SafeStr_12123
        {
            var stackLines:Array = new Error().getStackTrace().split("\n");
            stackLines.shift(); // Remove first line
            stackLines.shift(); // Remove second line
            
            var i:int;
            while (i < skipFromTop)
            {
                stackLines.shift();
                i++;
            };
            i = 0;
            while (i < skipFromBottom)
            {
                stackLines.pop();
                i++;
            };
            
            var functionPattern:RegExp = new RegExp("^\\s+(\\S+)\\s+\\S+?::");
            var paramPattern:RegExp = new RegExp("^([^[]+)\\(\\)\\[.*\\]$");
            var j:int;
            while (j < stackLines.length)
            {
                stackLines[j] = stackLines[j].replace(functionPattern, "");
                stackLines[j] = stackLines[j].replace(paramPattern, "$1");
                j++;
            };
            return (stackLines.reverse());
        }

        // Get object ID/hash from memory reference
        public static function getObjectId(obj:Object):String // _SafeStr_12124
        {
            var objectId:String;
            try
            {
                (DebugUtil(obj)); // Force type cast error to get memory reference
            }
            catch(error:Error)
            {
                objectId = String(error).replace(/.*([@|\$].*?) \S+ .*$/gi, "$1");
            };
            return (objectId);
        }

        // Get formatted stack trace as string with indentation
        public static function getFormattedStackTrace(skipFromTop:int=0, skipFromBottom:int=0):String // _SafeStr_12125
        {
            var stackArray:Array = DebugUtil.getStackTrace((skipFromTop + 1), skipFromBottom);
            var indent:String = "";
            var i:int;
            while (i < stackArray.length)
            {
                stackArray[i] = (indent + stackArray[i]);
                indent = (indent + "  ");
                i++;
            };
            return (stackArray.join("\n"));
        }

    }
}
