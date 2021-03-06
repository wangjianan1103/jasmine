package core.com.jasmine.service.impl;

import core.com.jasmine.dao.*;
import core.com.jasmine.exception.CoreException;
import core.com.jasmine.model.*;
import core.com.jasmine.model.lend.*;
import core.com.jasmine.service.BlogService;
import core.com.jasmine.utils.ErrorCode;
import core.com.jasmine.utils.Utility;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by wangjianan on 2016/2/17.
 */
@Service
public class BlogServiceImpl implements BlogService {
    private static final Logger logger = LoggerFactory.getLogger(BlogServiceImpl.class);

    @Autowired
    private BlogLoanDao blogLoanDao;
    @Autowired
    private BlogChannelDao blogChannelDao;
    @Autowired
    private BlogMarkDao blogMarkDao;
    @Autowired
    private ConfigBlogMarkDao configBlogMarkDao;
    @Autowired
    private FriendshipLinkDao friendshipLinkDao;

    @Override
    public BaseInfoResponse getIndexInfo() {
        logger.info("getIndexInfo()");
        BaseInfoResponse response = new BaseInfoResponse();
        List<BlogInfo> indexInfoRespList = new ArrayList<>();
        /**
         * 获取最新文章列表
         */
        List<BlogLoan> newBlogLoan = blogLoanDao.queryBlogLoanOrder();

        /** 查询合作链接信息 **/
        List<FriendshipLink> friendshipLinkList = friendshipLinkDao.selectByAll();

        response.setBlogInfoList(indexInfoRespList);
        response.setNewArticleList(newBlogLoan);
        response.setFriendshipLinkList(friendshipLinkList);
        return response;
    }

    @Override
    public IndexDetailResp getBlogDetail(IndexDetailReq indexDetailReq) {
        logger.info("getBlogDetail(): indexDetailReq={}", indexDetailReq);
        IndexDetailResp response = new IndexDetailResp();
        if (null == indexDetailReq || null == indexDetailReq.getBlogId()) {
            logger.info("getBlogDetail(): indexDetailReq or gid is null");
            throw new CoreException(ErrorCode.SYS_PARAMS_ERROR);
        }
        Integer id = indexDetailReq.getBlogId();
        // 更新文章查看次数
        blogLoanDao.updateBlogView(id);
        // 查询blog详细信息
        BlogLoanWithBLOBs blogLoan = blogLoanDao.selectById(id);
        String channelGid = blogLoan.getChannelGid();
        BlogChannel blogChannel = blogChannelDao.queryChannelByGid(channelGid);

        response.setId(blogLoan.getId());
        response.setName(blogLoan.getName());
        response.setGid(blogLoan.getGid());
        response.setContent(blogLoan.getContent());
        response.setViews(blogLoan.getViews());
        response.setChannelGid(channelGid);
        response.setChannelName(blogChannel.getName());
        response.setUserGid(blogLoan.getUserGid());
        response.setDateTime(Utility.getDateFormat(blogLoan.getCreateTime()));
        response.setDescription(blogLoan.getDescription());

        logger.info("getBlogDetail(): response={}", response);
        return response;
    }

    @Override
    public List<BlogInfo> queryInfoByLimit(IndexInfoReq indexInfoReq) {
        logger.info("queryInfoByLimit(): req={}", indexInfoReq);

        Integer pageIndex = indexInfoReq.getPageIndex();
        Integer pageSize = indexInfoReq.getPageSize();

        if (pageIndex < 0 && pageSize < 0) {
            throw new CoreException(ErrorCode.SYS_PARAMS_ERROR);
        }

        if (indexInfoReq.getChannelGid() != null) {
            String channelName = indexInfoReq.getChannelGid();
            BlogChannel channel = blogChannelDao.queryChannelByName(channelName);
            if (channel != null) {
                indexInfoReq.setChannelGid(channel.getGid());
            }
        }

        if (indexInfoReq.getMarkGid() != null) {
            String markName = indexInfoReq.getMarkGid();
            BlogMark mark = blogMarkDao.queryMarkByName(markName);
            if (mark != null) {
                indexInfoReq.setMarkGid(mark.getGid());
            }
        }

        List<BlogInfo> resultList = new ArrayList<>();
        List<BlogLoan> blogLoanList = blogLoanDao.queryBlogLoanByMarkOrChannelLimit(indexInfoReq.getChannelGid(), indexInfoReq.getMarkGid(), pageIndex, pageSize);
        if (blogLoanList != null) {
            for (BlogLoan blog : blogLoanList) {
//                BlogLoanWithBLOBs bloBs = blogLoanDao.selectByGid(blog.getGid());
                BlogChannel channel = blogChannelDao.queryChannelByGid(blog.getChannelGid());
                List<ConfigBlogMark> configBlogMarkList = configBlogMarkDao.queryConfigByBlogGid(blog.getGid());
                List<BlogMark> blogMarkList = blogMarkDao.queryMarkByGidList(Utility.getMarkList(configBlogMarkList));

                BlogInfo resp = new BlogInfo();
                resp.setId(blog.getId());
                resp.setGid(blog.getGid());
                resp.setTime(Utility.getDateTime(blog.getCreateTime()));
                resp.setName(blog.getName());
                resp.setViews(blog.getViews());
                resp.setTop(blog.getIsTop());
                resp.setBlogChannel(channel);
                resp.setBlogMarkList(blogMarkList);
                resp.setContent(blog.getDescription());

                resultList.add(resp);
            }
        }
        return resultList;
    }

    @Override
    public int queryInfoCount(IndexInfoReq indexInfoReq) {
        return blogLoanDao.queryInfoCount(indexInfoReq.getChannelGid(), indexInfoReq.getMarkGid());
    }

}
