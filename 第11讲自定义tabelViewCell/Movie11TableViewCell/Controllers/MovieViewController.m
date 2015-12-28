//
//  MovieViewController.m
//  Movie11TableViewCell
//
//  Created by scjy on 15/12/3.
//  Copyright (c) 2015年 赵佳慧iOS. All rights reserved.
//

#import "MovieViewController.h"
#import "MovieTableViewCell.h"
#import "Movie2TableViewCell.h"
#import "ShowIntroduceViewController.h"
@interface MovieViewController ()
@property(nonatomic,retain) UITableView *tableView;
@property(nonatomic,retain) NSArray *sectionTitleArray;
@property (nonatomic,retain) NSMutableArray *allMovieArray;

@end

@implementation MovieViewController
-(void)dealloc{
    [_tableView release];
    [super dealloc];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
 /*   展示影院名称，影院位置，影院联系方式
    cell根据影院位置自适应高度。
  */
    self.title = @"电影";
    self.tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    self.tableView.separatorColor = [UIColor blackColor];
    //设置代理
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
    [self.tableView release];

    [self configTableData];


}
- (void)configTableData{
    NSString *path = [[NSBundle mainBundle]pathForResource:@"Movie" ofType:@".plist"];
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:path];
    self.sectionTitleArray = dic.allKeys;
    self.allMovieArray = [NSMutableArray new];
    
    for (NSString *key in self.sectionTitleArray) {
        NSMutableArray *group = [NSMutableArray new];
        NSArray *array = dic[key];
        for (NSDictionary *dic in array) {
            MovieModel *model = [[MovieModel alloc]initWithDictionary:dic];
            [group addObject:model];
        }
        [self.allMovieArray addObject:group];
    }
    
}
#pragma mark-----代理方法
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSMutableArray *group = self.allMovieArray[section];//取出对应分区数组
    return group.count;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.sectionTitleArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    static NSString *movieCell = @"moveCell";
//    MovieTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:movieCell];
//    if (cell == nil) {
//        cell = [[MovieTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:movieCell];
//    }
    NSMutableArray *group = self.allMovieArray[indexPath.section];
    MovieModel *model = group[indexPath.row];
   
    
    if ([model.movieButtonTitton isEqualToString:@"购票"]) {
        static NSString *movie2Cell = @"move2Cell";
        Movie2TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:movie2Cell];
        if (cell == nil) {
            cell = [[Movie2TableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:movie2Cell];
        }
        cell.model = model;
        return cell ;
    }else{
        static NSString *movieCell = @"moveCell";
        MovieTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:movieCell];
        if (cell == nil) {
            cell = [[MovieTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:movieCell];
        }
        cell.model = model;
        return cell;
    }
    
    
    
}
//每一行高度 自定义每一行高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSMutableArray *group = self.allMovieArray[indexPath.section];
    MovieModel *movieModel = group[indexPath.row];
    
    CGFloat cellHeight = [MovieTableViewCell getCellHeightWithMovieModel:movieModel];
    return cellHeight;
    
}
//点击显示电影详情信息
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ShowIntroduceViewController *showMovie = [[ShowIntroduceViewController alloc]init];
    NSMutableArray *group = self.allMovieArray[indexPath.section];
    MovieModel *model = group[indexPath.row];
    showMovie.showImageName = model.movieImage;
    showMovie.showMovieName = model.movieName;
    showMovie.showIntroduce = model.showIntroduce;
    showMovie.showTime = model.movieTime;
    showMovie.showLeader = model.leaderModel;
    showMovie.showDirector = model.directorModel;
    showMovie.showAreay = model.areaModel;
    showMovie.showType = model.typeModel;
    
    [self.navigationController pushViewController:showMovie animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
