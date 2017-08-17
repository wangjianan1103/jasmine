package core.com.service;

import core.com.model.LightningResponse;
import core.com.model.lend.*;

import java.util.List;

/**
 *
 * Created by wangjianan on 2016/2/17.
 */
public interface BlogService {

    BaseInfoResponse getIndexInfo();

    /**
     * 查询详细信息
     *
     * @param indexDetailReq
     * @return
     */
    IndexDetailResp getBlogDetail(IndexDetailReq indexDetailReq);

    /**
     * 分页查询
     *
     * @param indexInfoReq 参数
     * @return 返回详情
     */
    List<BlogInfo> queryInfoByLimit(IndexInfoReq indexInfoReq);

}