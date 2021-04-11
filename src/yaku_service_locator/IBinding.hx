package yaku_service_locator;

import tink.CoreApi.Outcome;
import tink.CoreApi.Error;

interface IBinding {
    function set<T>(c:Class<T>, val:T):T;
    function get<T>(c:Class<T>): Null<T>;
}