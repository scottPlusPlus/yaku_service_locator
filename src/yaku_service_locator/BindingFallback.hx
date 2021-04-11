package yaku_service_locator;

using yaku_core.NullX;

class BindingFallback implements IBinding {

    public var fallback:IBinding;
    public var binding:IBinding;

    public function new(binding:IBinding, fallback:IBinding){
        this.binding = binding;
        this.fallback = fallback;
    }

	public function get<A>(c:Class<A>):Null<A> {
        return binding.get(c).orFallback(fallback.get(c));
    }

	public function set<A>(c:Class<A>, val:A):A {
		return binding.set(c,val);
	}
}
