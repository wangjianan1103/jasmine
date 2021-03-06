package core.com.jasmine.dao.mapper;

import core.com.jasmine.model.BlogChannel;
import core.com.jasmine.model.BlogChannelExample;
import java.util.List;

import core.com.jasmine.model.lend.BlogChannelMap;
import org.apache.ibatis.annotations.Param;

public interface BlogChannelMapper {
    int countByExample(BlogChannelExample example);

    int deleteByExample(BlogChannelExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(BlogChannel record);

    int insertSelective(BlogChannel record);

    List<BlogChannel> selectByExample(BlogChannelExample example);

    BlogChannel selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") BlogChannel record, @Param("example") BlogChannelExample example);

    int updateByExample(@Param("record") BlogChannel record, @Param("example") BlogChannelExample example);

    int updateByPrimaryKeySelective(BlogChannel record);

    int updateByPrimaryKey(BlogChannel record);

    List<BlogChannelMap> selectByGroupChannel();
}