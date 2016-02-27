//
//  ViewController.m
//  顶部滑动菜单
//
//  Created by qingyun on 16/2/25.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"
@interface ViewController ()<UIScrollViewDelegate,UITableViewDataSource,UITableViewDelegate>

@property (nonatomic ,strong) UIButton *btn1;
@property (nonatomic ,strong) UIButton *btn2;
@property (nonatomic ,strong) UIButton *btn3;
@property (nonatomic ,strong) UIButton *btn4;

@property (nonatomic ,strong) UIScrollView *scrollView;
@property (nonatomic ,strong) UIImageView *img;

@property (nonatomic ,strong) UITableView *tableView1;
@property (nonatomic ,strong) UITableView *tableView2;
@property (nonatomic ,strong) UITableView *tableView3;
@property (nonatomic ,strong) UITableView *tableView4;

@property (nonatomic ,strong) NSArray *array1;
@property (nonatomic ,strong) NSArray *array2;
@property (nonatomic ,strong) NSArray *array3;
@property (nonatomic ,strong) NSArray *array4;

@property (nonatomic) NSInteger index;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    _array1 = @[@"111111111",@"222222222",@"333333333",@"444444444",@"5555555555",@"666666666666",@"777777777777",@"88888888888",@"999999999999"];
    _array2 = @[@"qwert",@"qwert",@"erqewf"];
    _array3 = @[@"1234",@"aewgrsdthg",@"erdtfygkuhi"];
    _array4 = @[@"4eyrdtfg",@"rdtfygu",@"drtfyg"];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    _btn1 = [[UIButton alloc]init];
    _btn2 = [[UIButton alloc]init];
    _btn3 = [[UIButton alloc]init];
    _btn4 = [[UIButton alloc]init];
    
    [_btn1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_btn1 setTitle:@"A" forState:UIControlStateNormal];
    _btn1.backgroundColor = [UIColor blueColor];
    
    [_btn1 setTag:0];
    [_btn2 setTag:1];
    [_btn3 setTag:2];
    [_btn4 setTag:3];
    
    [_btn1 addTarget:self action:@selector(btn1:) forControlEvents:UIControlEventTouchDown];
    [_btn2 addTarget:self action:@selector(btn2:) forControlEvents:UIControlEventTouchDown];
    [_btn3 addTarget:self action:@selector(btn3:) forControlEvents:UIControlEventTouchDown];
    [_btn4 addTarget:self action:@selector(btn4:) forControlEvents:UIControlEventTouchDown];
    
    
    [_btn2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_btn2 setTitle:@"B" forState:UIControlStateNormal];
    _btn2.backgroundColor = [UIColor greenColor];
    
    
    [_btn3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_btn3 setTitle:@"C" forState:UIControlStateNormal];
    _btn3.backgroundColor = [UIColor orangeColor];
    
    
    [_btn4 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_btn4 setTitle:@"D" forState:UIControlStateNormal];
    _btn4.backgroundColor = [UIColor purpleColor];

    [self.view addSubview:_btn1];
    [self.view addSubview:_btn2];
    [self.view addSubview:_btn3];
    [self.view addSubview:_btn4];
    
    //调用自动布局。
    [self upMasonry];

#pragma mark  =======scrollView========
    
    
    int count = 4;
    _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 50, self.view.frame.size.width, self.view.frame.size.height - 50)];
    
    [self.view addSubview:_scrollView];
    
    
    _scrollView.contentSize = CGSizeMake(self.view.frame.size.width*count, self.view.frame.size.height - 50);
    //设置分页
    _scrollView.pagingEnabled = YES;
    //设置代理
    _scrollView.delegate = self;
    
    _scrollView.backgroundColor = [UIColor brownColor];
    
    
    _tableView1 = [[UITableView alloc]initWithFrame:CGRectMake(0,0, self.view.frame.size.width, self.view.frame.size.height - 50 ) style:UITableViewStylePlain];
    
    _tableView1.delegate = self;
    _tableView1.dataSource = self;
    
    _tableView1.rowHeight = 100;
    
    [_scrollView addSubview:_tableView1];
    
    
    _tableView2 = [[UITableView alloc]initWithFrame:CGRectMake(self.view.frame.size.width,0, self.view.frame.size.width, self.view.frame.size.height - 50 ) style:UITableViewStylePlain];
    
    _tableView2.delegate = self;
    _tableView2.dataSource = self;
    
    _tableView2.rowHeight = 60;
    
    [_scrollView addSubview:_tableView2];

    
    _tableView3 = [[UITableView alloc]initWithFrame:CGRectMake(self.view.frame.size.width * 2,0, self.view.frame.size.width , self.view.frame.size.height - 50 ) style:UITableViewStylePlain];
    
    _tableView3.delegate = self;
    _tableView3.dataSource = self;
    
    _tableView3.rowHeight = 150;
    
    [_scrollView addSubview:_tableView3];
    
    
    
    _tableView4 = [[UITableView alloc]initWithFrame:CGRectMake(self.view.frame.size.width * 3,0, self.view.frame.size.width , self.view.frame.size.height - 50 ) style:UITableViewStylePlain];
    
    _tableView4.delegate = self;
    _tableView4.dataSource = self;
    
    _tableView4.rowHeight = 30;
    
    [_scrollView addSubview:_tableView4];
    


    
//    for (int i = 0;i < count; i++) {
//        
//        _img = [[UIImageView alloc]initWithFrame:CGRectMake(self.view.frame.size.width * i, 0, self.view.frame.size.width, self.view.frame.size.height - 50)];
//        
//        
//        //设置scrollView的图片
//        
//        NSString *imageName = [NSString stringWithFormat:@"1_%d.jpg",i+1];
//        
//        _img.image = [UIImage imageNamed:imageName];
//        
//        [_scrollView addSubview:_img];
//    }
    
    // Do any additional setup after loading the view, typically from a nib.
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if ([tableView isEqual:self.tableView1]) {
        return self.array1.count;
    }
    
    if ([tableView isEqual:self.tableView2]) {
        return self.array2.count;
    }
    if ([tableView isEqual:self.tableView3]) {
        return self.array3.count;
    }
    if ([tableView isEqual:self.tableView4]) {
        return self.array4.count;
    }
    return (NSInteger)nil;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *idenfile = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:idenfile];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idenfile];
        
        if ([tableView isEqual:self.tableView1]) {
            cell.textLabel.text = _array1[indexPath.row];
        }
        if ([tableView isEqual:self.tableView2]) {
            cell.textLabel.text = _array2[indexPath.row];
        }
        if ([tableView isEqual:self.tableView3]) {
            cell.textLabel.text = _array3[indexPath.row];
        }
        if ([tableView isEqual:self.tableView4]) {
            cell.textLabel.text = _array4[indexPath.row];
        }

        
        
        
    }
    return cell;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma marl =============自动布局===============

-(void)upMasonry{

    [_btn1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top);
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(_btn2.mas_left);
        make.height.equalTo(@50);
        make.height.equalTo(@[_btn1,_btn2,_btn3,_btn4]);
        make.width.equalTo(@[_btn1,_btn2,_btn3,_btn4]);
        make.centerY.equalTo(@[_btn1,_btn2,_btn3,_btn4]);
    }];
    
    [_btn2 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.equalTo(_btn3.mas_left);
    }];
    
    [_btn3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_btn4.mas_left);
    }];
    
    [_btn4 mas_makeConstraints:^(MASConstraintMaker *make) {
       make.right.equalTo(self.view.mas_right);
    }];
    
}






- (void)btn1:(UIButton *)sender{
//让scrollView随左右按钮偏移
    self.scrollView.contentOffset = CGPointMake((_btn1.tag) * self.view.frame.size.width, 0);
}
- (void)btn2:(UIButton *)sender{
    
    self.scrollView.contentOffset = CGPointMake((_btn2.tag) * self.view.frame.size.width, 0);
}
- (void)btn3:(UIButton *)sender{

    self.scrollView.contentOffset = CGPointMake((_btn3.tag) * self.view.frame.size.width, 0);
}
- (void)btn4:(UIButton *)sender{

    self.scrollView.contentOffset = CGPointMake((_btn4.tag) * self.view.frame.size.width, 0);
}

@end
