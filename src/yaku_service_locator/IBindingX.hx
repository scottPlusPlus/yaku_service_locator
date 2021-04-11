package yaku_service_locator;

import tink.CoreApi.Lazy;
using yaku_core.NullX;

class IBindingX {

    public static function getOrSet<T>(b:IBinding, c:Class<T>, fallback:Lazy<T>):T {
		var maybe = b.get(c);
        if (maybe == null){
            var val = fallback.get();
            return b.set(c, val);
        }
        return maybe.nullThrows();
	}
}