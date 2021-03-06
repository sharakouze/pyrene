import { Observable } from '../Observable';
export declare function first<T, S extends T>(this: Observable<T>, predicate?: ((value: T, index: number, source: Observable<T>) => boolean) | ((value: T, index: number, source: Observable<T>) => value is S)): Observable<S>;
export declare function first<T>(this: Observable<T>, predicate: (value: T, index: number, source: Observable<T>) => boolean, resultSelector: void, defaultValue?: T): Observable<T>;
export declare function first<T, S extends T, R>(this: Observable<T>, predicate: ((value: T, index: number, source: Observable<T>) => boolean) | ((value: T, index: number, source: Observable<T>) => value is S), resultSelector?: ((value: S, index: number) => R) | void, defaultValue?: S): Observable<S>;
export declare function first<T, R>(this: Observable<T>, predicate?: (value: T, index: number, source: Observable<T>) => boolean, resultSelector?: (value: T, index: number) => R, defaultValue?: R): Observable<R>;
