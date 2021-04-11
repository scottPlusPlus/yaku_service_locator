package yaku_service_locator_test;

import yaku_core.test_utils.TestVals;
import yaku_service_locator.ServiceLocator;
import yaku_service_locator.Binding;
import utest.Assert;

using yaku_core.NullX;

class ServiceLocatorTest extends utest.Test {

    public function testGetSet(){
        var binding = new Binding();
        ServiceLocator.overrideInstance(binding);

        var foo = new TestFoo(TestVals.foo);
        ServiceLocator.set(TestFoo, foo);
        var actual = ServiceLocator.get(TestFoo).nullThrows();
        Assert.equals(foo.val,  actual.val);

        var foo2 = new TestFoo(TestVals.foo2);
        ServiceLocator.set(TestFoo, foo2);
        actual = ServiceLocator.get(TestFoo).nullThrows();
        Assert.equals(foo2.val,  actual.val);

        var bar = new TestBar(TestVals.bar);
        ServiceLocator.set(TestBar, bar);
        var actualBar = ServiceLocator.get(TestBar).nullThrows();
        Assert.equals(bar.val,  actualBar.val);
    }

    public function testOverrideInstance(){
        ServiceLocator.overrideInstance(new Binding());
        var foo = new TestFoo(TestVals.foo);
        ServiceLocator.set(TestFoo, foo);
        var actual = ServiceLocator.get(TestFoo);
        Assert.equals(foo.val,  actual.val);

        ServiceLocator.overrideInstance(new Binding());
        actual = ServiceLocator.get(TestFoo);
        Assert.isNull(actual);
    }

}

class TestFoo {
    public var val:String;
    public function new(v:String){
        val = v;
    }
}

class TestBar {
    public var val:String;
    public function new(v:String){
        val = v;
    }
}