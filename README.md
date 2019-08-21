# RACNetwork
> RAC + YTKNetwork



注意：

1. `TKBaseRACRequest+RACSupport.m`方法

```objective-c
+ (void)requestResultFailureWithRequest:(YTKBaseRequest *)request
                              subscribe:(id<RACSubscriber>)subscriber
                             isNetError:(BOOL)isNetError
```

* 函数体中，需要根据后端字段指定`msg`和`code`

