return function()
    local ok, comment = pcall(require, 'Comment')
    if not ok then
        return
    else
        comment.setup()
    end
end
