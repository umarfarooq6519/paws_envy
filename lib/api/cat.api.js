const express = require("express");
const cors = require("cors");
const { TheCatAPI } = require("@thatapicompany/thecatapi");

const app = express();
app.use(cors());

const theCatAPI = new TheCatAPI(
  "live_fmPgodLU70tymdwHgBH6EHn9uYAV8QeqrB28t1Qyx5vaAer4FeKRJP2RaV3Xm21U"
);

app.get("/cats", async (req, res) => {
  try {
    const images = await getImagesWithBreeds();
    console.log(images);

    res.json(images);
  } catch (error) {
    res.status(500).json({ error: "Failed to fetch cat data" });
  }
});

async function getImagesWithBreeds() {
  const images = await theCatAPI.images.searchImages({
    limit: 10,
    hasBreeds: true,
    mimeTypes: ["png"],
  });
  return images;
}

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => console.log(`Server running on port ${PORT}`));
