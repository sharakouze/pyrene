export interface PagedData<T> {
    data?: T[];
    sort: string;
    pageIndex: number;
    pageSize: number;
    pageCount?: number;
}
