package vo

import com.intelligrape.anatomyfacts.Tag

class AllTagsVO {
    String label
    Long id

    AllTagsVO(Tag tag) {
        this.label = tag.label
        this.id = tag.id
    }

    public static List<Tag> getTagVos(List<Tag> tags) {
        List<AllTagsVO> vos = []
        if (tags) {
            tags.each {tag ->
                vos << new AllTagsVO(tag)
            }
        }
    }

    public static getMergedTagVos(List<Tag> originalTags, List<Tag> userTags, List<Tag> existingTags) {
        List<AllTagsVO> allTagsVOs = []
        List<Tag> allTags = []
        allTags.addAll(userTags ? userTags : [])
        allTags.addAll(originalTags ? originalTags : [])
        allTags = (existingTags && allTags) ? (allTags - existingTags) : allTags
        allTags.unique { tag ->
            tag.id
        }
        allTagsVOs = getTagVos(allTags)
        allTagsVOs.sort {tagVo ->
            tagVo.label
        }
        return allTagsVOs
    }

    public static List<AllTagsVO> getTagVOs(List<AllTagsVO> allTagsVOs, String searchString, Integer max) {
        List<TagVO> results = []
        if (allTagsVOs) {
            allTagsVOs = (allTagsVOs.size() <= max) ? allTagsVOs : allTagsVOs.getAt(0..max)
            results = allTagsVOs.collect {new TagVO(it.label)}
            results.add(new TagVO(searchString))
        }
        results.add(new TagVO(searchString))
        results = results.unique {it.label}
        return results
    }
}
