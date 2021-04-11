package yaku_service_locator;

import tink.CoreApi;

using yaku_service_locator.IBindingX;

class ServiceLocator {
	private static var _instance:IBinding;

	
	public static function overrideInstance(b:IBinding) {
		_instance = b;
	}

	public static function getInstance():IBinding {
		return _instance;
	}

	public static function get<T>(c:Class<T>): Null<T> {
        return _instance.get(c);
	}

	public static function ensure<T>(c:Class<T>, fallback:Lazy<T>):T {
        return _instance.getOrSet(c, fallback);
	}

	public static function set<T>(c:Class<T>, val:T):T {
		return _instance.set(c, val);
	}
}