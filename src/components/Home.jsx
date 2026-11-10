const Home = () => {
  return (
    <video
      className="h-screen w-full object-cover object-center"
      src="/images/bulbasaur.mp4"
      poster="/images/bulbasaur-poster.webp"
      autoPlay
      muted
      loop
      playsInline
      preload="auto"
      aria-label="Bulbasaur sitting on a mossy log in a sunlit forest"
    />
  );
};
export default Home;
