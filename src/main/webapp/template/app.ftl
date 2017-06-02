<#macro head>
<head lang="en">
    <title>佳楠的个人博客</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1"/>
    <base href="/">
    <link rel="stylesheet" href="../assets/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="../assets/css/bootstrap-theme.min.css"/>
    <link rel="stylesheet" href="../assets/css/common.css">
    <link rel="stylesheet" href="../assets/css/dark.css">
    <link href="http://og4nfuylr.bkt.clouddn.com/wang.png" rel="icon">
    <link rel="stylesheet" href="../assets/test/animate.css">
    <link rel="stylesheet" href="../assets/test/app.css">
    <link rel="stylesheet" href="../assets/test/font.css">
    <link rel="stylesheet" href="../assets/test/font-awesome.min.css">
    <link rel="stylesheet" href="../assets/test/simple-line-icons.css">
    <script src="../assets/lib/jquery/jquery.min.js"></script>
    <script src="../assets/lib/bootstrap/bootstrap.min.js"></script>

    <meta name="og:site_name" content="佳楠的个人博客">
    <meta name="og:url" content="https://www.oopmind.com">
    <meta name="theme-color" content="#007fff">
    <meta name="keywords" content="安全技术,人工智能,Java,AI开发,机器学习,智能世界,读后感,书籍分享,思维导图">
    <meta name="description"
          content="这是我的个人博客网站，主要是对所学知识的梳理和总结，同时也希望能够帮到其他童鞋。有分享才有进步，分享促进技术变革。">
</head>
</#macro>

<#macro article type>
    <#if type="yes">
    <!-- 内容区 -->
    <article>
        <div class="container-fluid">
            <!--<home_article></home_article>-->
            <div class="col-md-1"></div>
            <div class="col-md-7">
                <#list infoList as item>
                    <div class="row-fluid">
                        <div class="thumbnail">
                            <div class="caption">
                                <h3>
                                    <a href="/view/${item.gid}" class="title">${item.name}</a>
                                </h3>
                                <div class="caption">
                                    <span class="glyphicon glyphicon-calendar" aria-hidden="true"></span>
                                ${item.time}"前"
                                    &nbsp; | &nbsp;
                                    <span class="glyphicon glyphicon-flag" aria-hidden="true"></span>
                                ${item.blogChannel.name}
                                    &nbsp; | &nbsp;
                                    <span class="glyphicon glyphicon-user" aria-hidden="true"></span>
                                    <a href="" class="link" data-toggle="tooltip" data-placement="top" title="由小楠同学发布">小楠同学</a>
                                    &nbsp; | &nbsp;
                                    <span class="glyphicon glyphicon-comment" aria-hidden="true"></span>
                                    7条评论
                                    &nbsp; | &nbsp;
                                    <span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span>
                                ${item.views} views
                                </div>
                                <hr class="hr" noshade="noshade">
                                <div class="caption hide_p">
                                    <div>
                                    ${item.gid}
                                    </div>
                                </div>
                                <div class="repeat-widget">
                                    <p></p>
                                    <#list item.blogMarkList as mark>
                                        <a class="label label-success" colorIn>${mark.name}</a>
                                    </#list>
                                </div>
                            </div>
                        </div>
                    </div>
                </#list>
            </div>
            <div class="col-md-3">
                <!-- 查询 -->
                <!--<div class="thumbnail">-->
                <!--<div class="input-group">-->
                <!--<input type="text" class="form-control" placeholder="Search for...">-->
                <!--<span class="input-group-btn">-->
                <!--<button class="btn btn-default" type="button">-->
                <!--<span class="glyphicon glyphicon-search" aria-hidden="true"></span>-->
                <!--</button>-->
                <!--</span>-->
                <!--</div>-->
                <!--</div>-->
                <!--<div class="alert alert-warning alert-dismissible" role="alert">-->
                <!--<button type="button" class="close" data-dismiss="alert" aria-label="Close">-->
                <!--<span aria-hidden="true">&times;</span>-->
                <!--</button>-->
                <!--<strong>Warning!</strong> 主要是对所学知识的梳理和总结，同时也希望能够帮到其他童鞋。现在我给网站添加了云音乐，各位写代码写累了不妨来听听音乐O(∩_∩)O~-->
                <!--</div>-->
                <div class="alert alert-info" role="alert">
                    主要是对所学知识的梳理和总结，同时也希望能够帮到其他童鞋。现在我给网站添加了云音乐，各位写代码写累了不妨来听听音乐O(∩_∩)O~
                </div>

                <div class="thumbnail">
                    <h4 style="margin-left: 10px;">最新文章</h4>
                    <hr class="hr">
                    <table class="table table-condensed">
                        <#list response.newArticleList as item>
                            <tr>
                                <td>
                                    <a class="link" style="font-size: small"
                                       routerLink="/view/{{model.gid}}">${item.name}</a>
                                </td>
                            </tr>
                        </#list>
                    </table>
                </div>

                <div class="thumbnail">
                    <h4 style="margin-left: 10px;">标签</h4>
                    <hr class="hr" noshade="noshade">
                    <#list markList as item>
                        <a href="" class="link" [markCloud]="item.count" data-toggle="tooltip"
                           data-placement="top" title="${item.count} 个话题" (click)="goMark(mark.markGid)">
                        ${item.markName}
                        </a>
                    </#list>
                </div>

                <div class="thumbnail">
                    <h4 style="margin-left: 10px;">分类</h4>
                    <hr class="hr" noshade="noshade">
                    <ul class="list-group">
                        <#list channelMapList as channel>
                            <li class="list-group-item">
                                <span class="badge badge-info">${channel.count}</span>
                            ${channel.name}
                            </li>
                        </#list>
                    </ul>
                </div>

                <div class="thumbnail">
                    <h4 style="margin-left: 10px;">友情链接</h4>
                    <hr class="hr">

                    <table class="table">
                        <#list response.friendshipLinkList as friend>
                            <tr>
                                <td>
                                    <a class="link" href="${friend.url}" target="view_window">${friend.name}</a>
                                </td>
                            </tr>
                        </#list>
                    </table>
                </div>
            </div>
            <div class="col-md-1"></div>
        </div>
    </article>
    <#else>
    <div class="container">
        <div class="col-md-12 thumbnail" style="padding-left: 50px; padding-right: 30px;">
            <div class="caption page-header" style="text-align: center">
                <h3>
                    <span>${blog.name}</span>
                </h3>
                <div class="caption">
                    <span class="glyphicon glyphicon-calendar" aria-hidden="true"></span>
                ${blog.dateTime}
                    &nbsp; | &nbsp;
                    <span class="glyphicon glyphicon-flag" aria-hidden="true"></span>
                ${blog.channelName}
                    &nbsp; | &nbsp;
                    <span class="glyphicon glyphicon-user" aria-hidden="true"></span>
                    <a href="" class="" data-toggle="tooltip" data-placement="top" title="由admin发布">admin</a>
                    &nbsp; | &nbsp;
                    <span class="glyphicon glyphicon-comment" aria-hidden="true"></span>
                    7条评论
                    &nbsp; | &nbsp;
                    <span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span>
                ${blog.views} views
                </div>
                <hr class="hr" noshade="noshade">
                <!--<div class="caption" ng-bind-html="model.content|htmlContent"></div>-->
            </div>
            <div>${blog.content}</div>
            <div class="bs-docs-section">
                <div class="bs-callout bs-callout-info">
                    <p>原文地址 : <a routerLink="/view/${blog.gid}">http://www.oopmind.com/view/${blog.gid}</a></p>
                    <p>本站遵循 : 署名-非商业性使用-相同方式共享 2.5 中国大陆 (CC BY-NC-SA 2.5)</p>
                    <p>版权声明 : 原创文章转载时，请务必以超链接形式标明文章原始出处</p>
                </div>
            </div>
        </div>
    </div>
    </#if>

</#macro>

<#macro app>

</#macro>

<#macro navbar>
    <!-- navbar -->
    <div class="app-header navbar">
        <!-- navbar header -->
        <div class="navbar-header bg-dark">
            <button menu-toggle class="pull-right visible-xs dk" data-toggle="show" data-target="navbar-collapse">
                <i class="glyphicon glyphicon-cog"></i>
            </button>
            <button menu-toggle class="pull-right visible-xs" data-toggle="off-screen" data-target="app-aside">
                <i class="glyphicon glyphicon-align-justify"></i>
            </button>
            <!-- brand -->
            <a href="" class="navbar-brand text-lt">
                <i class="fa fa-btc"></i>
                <img src="../../assets/image/logo.png" alt="." class="hide">
                <span class="hidden-folded m-l-xs">oopMind</span>
            </a>
            <!-- / brand -->
        </div>
        <!-- / navbar header -->

        <!-- navbar collapse -->
        <div class="collapse pos-rlt navbar-collapse box-shadow bg-white-only" id="navbar-collapse">
            <!-- buttons -->
            <div class="nav navbar-nav hidden-xs">
                <a menu-toggle class="btn no-shadow navbar-btn" data-toggle="app-aside-folded" data-target="menu_app">
                    <i class="fa fa-dedent fa-fw text"></i>
                    <i class="fa fa-indent fa-fw text-active"></i>
                </a>
            </div>
            <!-- / buttons -->

            <!-- link and dropdown -->
            <ul class="nav navbar-nav hidden-sm">
                <li class="dropdown pos-stc">
                    <a href="#" data-toggle="dropdown" class="dropdown-toggle">
                        <span>Mega</span>
                        <span class="caret"></span>
                    </a>
                    <div class="dropdown-menu wrapper w-full bg-white">
                        <div class="row">
                            <div class="col-sm-4">
                                <div class="m-l-xs m-t-xs m-b-xs font-bold">Pages <span
                                        class="badge badge-sm bg-success">10</span></div>
                                <div class="row">
                                    <div class="col-xs-6">
                                        <ul class="list-unstyled l-h-2x">
                                            <li>
                                                <a href><i class="fa fa-fw fa-angle-right text-muted m-r-xs"></i>Profile</a>
                                            </li>
                                            <li>
                                                <a href><i
                                                        class="fa fa-fw fa-angle-right text-muted m-r-xs"></i>Post</a>
                                            </li>
                                            <li>
                                                <a href><i class="fa fa-fw fa-angle-right text-muted m-r-xs"></i>Search</a>
                                            </li>
                                            <li>
                                                <a href><i class="fa fa-fw fa-angle-right text-muted m-r-xs"></i>Invoice</a>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="col-xs-6">
                                        <ul class="list-unstyled l-h-2x">
                                            <li>
                                                <a href><i
                                                        class="fa fa-fw fa-angle-right text-muted m-r-xs"></i>Price</a>
                                            </li>
                                            <li>
                                                <a href><i class="fa fa-fw fa-angle-right text-muted m-r-xs"></i>Lock
                                                    screen</a>
                                            </li>
                                            <li>
                                                <a href><i class="fa fa-fw fa-angle-right text-muted m-r-xs"></i>Sign in</a>
                                            </li>
                                            <li>
                                                <a href><i class="fa fa-fw fa-angle-right text-muted m-r-xs"></i>Sign up</a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-4 b-l b-light">
                                <div class="m-l-xs m-t-xs m-b-xs font-bold">UI Kits <span
                                        class="label label-sm bg-primary">12</span></div>
                                <div class="row">
                                    <div class="col-xs-6">
                                        <ul class="list-unstyled l-h-2x">
                                            <li>
                                                <a href><i class="fa fa-fw fa-angle-right text-muted m-r-xs"></i>Buttons</a>
                                            </li>
                                            <li>
                                                <a href><i class="fa fa-fw fa-angle-right text-muted m-r-xs"></i>Icons
                                                    <span class="badge badge-sm bg-warning">1000+</span></a>
                                            </li>
                                            <li>
                                                <a href><i
                                                        class="fa fa-fw fa-angle-right text-muted m-r-xs"></i>Grid</a>
                                            </li>
                                            <li>
                                                <a href><i class="fa fa-fw fa-angle-right text-muted m-r-xs"></i>Widgets</a>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="col-xs-6">
                                        <ul class="list-unstyled l-h-2x">
                                            <li>
                                                <a href><i class="fa fa-fw fa-angle-right text-muted m-r-xs"></i>Bootstap</a>
                                            </li>
                                            <li>
                                                <a href><i class="fa fa-fw fa-angle-right text-muted m-r-xs"></i>Sortable</a>
                                            </li>
                                            <li>
                                                <a href><i class="fa fa-fw fa-angle-right text-muted m-r-xs"></i>Portlet</a>
                                            </li>
                                            <li>
                                                <a href><i class="fa fa-fw fa-angle-right text-muted m-r-xs"></i>Timeline</a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-4 b-l b-light">
                                <div class="m-l-xs m-t-xs m-b-sm font-bold">Analysis</div>
                                <div class="text-center">
                                    <div class="inline">

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </li>
            </ul>
            <!-- / link and dropdown -->

            <!-- search form -->
            <form class="navbar-form navbar-form-sm navbar-left shift" data-target=".navbar-collapse" role="search">
                <div class="form-group">
                    <div class="input-group">
                        <input type="text"
                               typeahead="state for state in states | filter:$viewValue | limitTo:8"
                               class="form-control input-sm bg-light no-border rounded padder"
                               placeholder="Search projects...">
                            <span class="input-group-btn">
                    <button type="submit" class="btn btn-sm bg-light rounded"><i class="fa fa-search"></i></button>
                  </span>
                    </div>
                </div>
            </form>
            <!-- / search form -->

            <!-- navbar right -->
            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                    <a href="#" data-toggle="dropdown" class="dropdown-toggle">
                        <i class="icon-bell fa-fw"></i>
                        <span class="visible-xs-inline">Notifications</span>
                        <span class="badge badge-sm up bg-danger pull-right-xs">2</span>
                    </a>
                    <!-- dropdown -->
                    <div class="dropdown-menu w-xl animated fadeInUp">
                        <div class="panel bg-white">
                            <div class="panel-heading b-light bg-light">
                                <strong>You have <span>2</span> notifications</strong>
                            </div>
                            <div class="list-group">
                                <a href class="media list-group-item">
                        <span class="pull-left thumb-sm">
                          <img src="../../assets/image/wang.png" alt="..." class="img-circle">
                        </span>
                                        <span class="media-body block m-b-none">
                          Use awesome animate.css<br>
                          <small class="text-muted">10 minutes ago</small>
                        </span>
                                </a>
                                <a href class="media list-group-item">
                        <span class="media-body block m-b-none">
                          1.0 initial released<br>
                          <small class="text-muted">1 hour ago</small>
                        </span>
                                </a>
                            </div>
                            <div class="panel-footer text-sm">
                                <a href class="pull-right"><i class="fa fa-cog"></i></a>
                                <a href="#notes" data-toggle="class:show animated fadeInRight">See all the
                                    notifications</a>
                            </div>
                        </div>
                    </div>
                    <!-- / dropdown -->
                </li>
                <li class="dropdown">
                    <a href="#" data-toggle="dropdown" class="dropdown-toggle clear" data-toggle="dropdown">
                            <span class="thumb-sm avatar pull-right m-t-n-sm m-b-n-sm m-l-sm">
                            <img src="../../assets/image/wang.png" alt="...">
                            <i class="on md b-white bottom"></i>
                            </span>
                        <span class="hidden-sm hidden-md">John.Smith</span> <b class="caret"></b>
                    </a>
                    <!-- dropdown -->
                    <ul class="dropdown-menu animated fadeInRight w">
                        <li class="wrapper b-b m-b-sm bg-light m-t-n-xs">
                            <div>
                                <p>300mb of 500mb used</p>
                            </div>
                        </li>
                        <li>
                            <a href>
                                <span class="badge bg-danger pull-right">30%</span>
                                <span>Settings</span>
                            </a>
                        </li>
                        <li>
                            <a>Profile</a>
                        </li>
                        <li>
                            <a>
                                <span class="label bg-info pull-right">new</span>
                                Help
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a>Logout</a>
                        </li>
                    </ul>
                    <!-- / dropdown -->
                </li>
            </ul>
            <!-- / navbar right -->

        </div>
        <!-- / navbar collapse -->
    </div>
    <!-- / navbar -->
</#macro>

<#macro menu>
    <!-- menu -->
    <div class="app-aside hidden-xs bg-dark" id="app-aside">
        <div class="aside-wrap">
            <div class="navi-wrap">
                <!-- user -->
                <div class="clearfix hidden-xs text-center" id="aside-user">
                    <div class="dropdown wrapper">
                        <a>
                                <span class="thumb-lg w-auto-folded avatar m-t-sm">
                                  <img src="../../assets/image/wang.png" class="img-full" alt="...">
                                </span>
                        </a>
                        <a href="#" data-toggle="dropdown" class="dropdown-toggle hidden-folded">
                                <span class="clear">
                                  <span class="block m-t-sm">
                                    <strong class="font-bold text-lt">WangJiaNan</strong>
                                    <b class="caret"></b>
                                  </span>
                                  <span class="text-muted text-xs block">程序猿</span>
                                </span>
                        </a>
                        <!-- dropdown -->
                        <ul class="dropdown-menu animated fadeInRight w hidden-folded">
                            <li class="wrapper b-b m-b-sm bg-info m-t-n-xs">
                                <span class="arrow top hidden-folded arrow-info"></span>
                                <div>
                                    <p>300mb of 500mb used</p>
                                </div>
                            </li>
                            <li>
                                <a>Settings</a>
                            </li>
                            <li>
                                <a>Profile</a>
                            </li>
                            <li>
                                <a>
                                    <span class="badge bg-danger pull-right">3</span>
                                    Notifications
                                </a>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <a>Logout</a>
                            </li>
                        </ul>
                        <!-- / dropdown -->
                    </div>
                    <div class="line dk hidden-folded"></div>
                </div>
                <!-- / user -->

                <!-- nav -->
                <nav class="navi">
                    <ul class="nav">
                        <li class="hidden-folded padder m-t m-b-sm text-muted text-xs">
                            <span>导航</span>
                        </li>
                        <li>
                            <a ui-nav routerLink="" class="auto">
                                    <span class="pull-right text-muted">
                                    <i class="fa fa-fw fa-angle-right text"></i>
                                    <i class="fa fa-fw fa-angle-down text-active"></i>
                                    </span>
                                <i class="glyphicon glyphicon-stats icon text-primary-dker"></i>
                                <span class="font-bold">仪表盘</span>
                            </a>
                            <ul class="nav nav-sub dk">
                                <li class="nav-sub-header">
                                    <a href>
                                        <span>仪表盘</span>
                                    </a>
                                </li>
                                <li>
                                    <a>
                                        <span>Dashboard v1</span>
                                    </a>
                                </li>
                                <li>
                                    <a>
                                        <b class="label bg-info pull-right">N</b>
                                        <span>Dashboard v2</span>
                                    </a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a ui-nav routerLink="/mark">
                                <i class="glyphicon glyphicon-bookmark icon text-info-dker"></i>
                                <span class="font-bold">标签</span>
                            </a>
                        </li>
                        <li>
                            <a ui-nav routerLink="/channel">
                                <i class="glyphicon glyphicon-briefcase icon text-info-lter"></i>
                                <span class="font-bold">类型</span>
                            </a>
                        </li>
                        <li>
                            <a ui-nav routerLink="/blog" class="auto">
                                    <span class="pull-right text-muted">
                                    <i class="fa fa-fw fa-angle-right text"></i>
                                    <i class="fa fa-fw fa-angle-down text-active"></i>
                                    </span>
                                <i class="glyphicon glyphicon-th-large icon text-success"></i>
                                <span class="font-bold">文章</span>
                            </a>
                            <ul class="nav nav-sub dk">
                                <li class="nav-sub-header">
                                    <a href>
                                        <span>文章</span>
                                    </a>
                                </li>
                                <li>
                                    <a>
                                        <span>Note</span>
                                    </a>
                                </li>
                                <li>
                                    <a>
                                        <span>Contacts</span>
                                    </a>
                                </li>
                                <li>
                                    <a>
                                        <span>Weather</span>
                                    </a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a ui-nav routerLink="/friend">
                                <i class="glyphicon glyphicon-briefcase icon text-info-lter"></i>
                                <span class="font-bold">友链</span>
                            </a>
                        </li>

                        <li class="line dk"></li>

                        <li class="hidden-folded padder m-t m-b-sm text-muted text-xs">
                            <span translate="aside.nav.components.COMPONENTS">组件</span>
                        </li>
                        <li>
                            <a ui-nav class="auto">
                                    <span class="pull-right text-muted">
                                    <i class="fa fa-fw fa-angle-right text"></i>
                                    <i class="fa fa-fw fa-angle-down text-active"></i>
                                    </span>
                                <b class="badge bg-info pull-right">3</b>
                                <i class="glyphicon glyphicon-th"></i>
                                <span>Layout</span>
                            </a>
                            <ul class="nav nav-sub dk">
                                <li class="nav-sub-header">
                                    <a href>
                                        <span>Layout</span>
                                    </a>
                                </li>
                                <li>
                                    <a>
                                        <span>Application</span>
                                    </a>
                                </li>
                                <li>
                                    <a>
                                        <span>Full width</span>
                                    </a>
                                </li>
                                <li>
                                    <a>
                                        <span>Mobile</span>
                                    </a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a ui-sref="app.chart">
                                <i class="glyphicon glyphicon-signal"></i>
                                <span translate="aside.nav.components.CHART">Chart</span>
                            </a>
                        </li>
                        <li ng-class="{active:$state.includes('app.page')}">
                            <a ui-nav class="auto">
                                    <span class="pull-right text-muted">
                                    <i class="fa fa-fw fa-angle-right text"></i>
                                    <i class="fa fa-fw fa-angle-down text-active"></i>
                                    </span>
                                <i class="glyphicon glyphicon-file icon"></i>
                                <span translate="aside.nav.components.pages.PAGES">Pages</span>
                            </a>
                            <ul class="nav nav-sub dk">
                                <li class="nav-sub-header">
                                    <a href>
                                        <span translate="aside.nav.components.pages.PAGES">Pages</span>
                                    </a>
                                </li>
                                <li>
                                    <a>
                                        <span translate="aside.nav.components.pages.SIGNIN">Signin</span>
                                    </a>
                                </li>
                                <li>
                                    <a>
                                        <span translate="aside.nav.components.pages.SIGNUP">Signup</span>
                                    </a>
                                </li>
                                <li>
                                    <a>
                                        <span translate="aside.nav.components.pages.FORGOT_PASSWORD">Forgot password</span>
                                    </a>
                                </li>
                                <li>
                                    <a>
                                        <span translate="aside.nav.components.pages.404">404</span>
                                    </a>
                                </li>
                            </ul>
                        </li>

                        <li class="line dk hidden-folded"></li>

                        <li class="hidden-folded padder m-t m-b-sm text-muted text-xs">
                            <span translate="aside.nav.your_stuff.YOUR_STUFF">Your Stuff</span>
                        </li>
                        <li>
                            <a ui-nav>
                                <i class="icon-user icon text-success-lter"></i>
                                <b class="badge bg-success pull-right">30%</b>
                                <span translate="aside.nav.your_stuff.PROFILE">Profile</span>
                            </a>
                        </li>
                        <li>
                            <a ui-nav>
                                <i class="icon-question icon"></i>
                                <span translate="aside.nav.your_stuff.DOCUMENTS">Documents</span>
                            </a>
                        </li>
                    </ul>
                </nav>
                <!-- nav -->
            </div>
        </div>
    </div>
    <!-- / menu -->
</#macro>

<#macro content>
    <!-- content -->
    <div class="app-content">
        <router-outlet></router-outlet>
    </div>
    <!-- /content -->

    <!-- aside right -->
    <div class="app-aside-right pos-fix no-padder w-md w-auto-xs bg-white b-l animated fadeInRight hide">
        <div class="vbox">
            <div class="wrapper b-b b-t b-light m-b">
                <a href class="pull-right text-muted text-md" data-toggle="class:show" data-target=".app-aside-right"><i
                        class="icon-close"></i></a>
                Chat
            </div>
            <div class="row-row">
                <div class="cell">
                    <div class="cell-inner padder">
                        <!-- chat list -->
                        <div class="m-b">
                            <a href class="pull-left thumb-xs avatar"><img src="../../assets/image/wang.png" alt="..."></a>
                            <div class="clear">
                                <div class="pos-rlt wrapper-sm b b-light r m-l-sm">
                                    <span class="arrow left pull-up"></span>
                                    <p class="m-b-none">Hi John, What's up...</p>
                                </div>
                                <small class="text-muted m-l-sm"><i class="fa fa-ok text-success"></i> 2 minutes ago
                                </small>
                            </div>
                        </div>
                        <div class="m-b">
                            <a href class="pull-right thumb-xs avatar"><img src="../../assets/image/wang.png" class="img-circle"
                                                                            alt="..."></a>
                            <div class="clear">
                                <div class="pos-rlt wrapper-sm bg-light r m-r-sm">
                                    <span class="arrow right pull-up arrow-light"></span>
                                    <p class="m-b-none">Lorem ipsum dolor :)</p>
                                </div>
                                <small class="text-muted">1 minutes ago</small>
                            </div>
                        </div>
                        <div class="m-b">
                            <a href class="pull-left thumb-xs avatar"><img src="../../assets/image/wang.png" alt="..."></a>
                            <div class="clear">
                                <div class="pos-rlt wrapper-sm b b-light r m-l-sm">
                                    <span class="arrow left pull-up"></span>
                                    <p class="m-b-none">Great!</p>
                                </div>
                                <small class="text-muted m-l-sm"><i class="fa fa-ok text-success"></i>Just Now</small>
                            </div>
                        </div>
                        <!-- / chat list -->
                    </div>
                </div>
            </div>
            <div class="wrapper m-t b-t b-light">
                <form class="m-b-none">
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="Say something">
                            <span class="input-group-btn">
                    <button class="btn btn-default" type="button">SEND</button>
                  </span>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!-- / aside right -->

    <!-- footer -->
    <div class="app-footer wrapper b-t bg-light">
        <div>
            ©2017-2020 <a href="http://www.oopmind.com"><em style="color:#496;">佳楠博客</em></a>
            | 京ICP备17012872号
        </div>
    </div>
    <!-- / footer -->
</#macro>