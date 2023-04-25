const app = require('./app')

const port = process.env.PORT || 3000

app.listen(port, () => {
  console.log(`App listening at http://0.0.0.0:${port}`)
})
