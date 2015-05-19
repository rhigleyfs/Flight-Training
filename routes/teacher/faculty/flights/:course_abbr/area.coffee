express = require('express')
router  = express.Router()
models  = appRequire('models')


# add the area to the term and levels
router.post '/', (req, res, next) ->
  models.Area.create
    name: req.body.name
    CourseId: req.course_id
  .then (area) ->
    for level in req.body['levels[]']
      area.addLevel level
    res.redirect "/faculty/flights/#{req.course_abbr}/settings"


module.exports = router