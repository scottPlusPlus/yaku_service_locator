package yaku_service_locator;

#if (java || cs) @:dce #end // this make sure the generic method is not genrated
class Binding implements IBinding {

	var registry:Map<Dynamic, Dynamic>;

	public function new() {
		this.registry = cast new haxe.ds.ObjectMap();
	}

	#if (java || cs)
	@:extern
	#end
	public function get<A>(c:Class<A>):Null<A> {
		return registry[c];
	}

	#if (java || cs)
	@:extern
	#end
	public function set<A>(c:Class<A>, val:A):A {
		registry[c] = val;
		return val;
	}
}
