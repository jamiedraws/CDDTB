using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Dtm.Framework.ClientSites;

namespace CDDT.Models
{
    public class MediaPlayer
    {
        public List<string> VideoLabels;
        public List<string> VideoIds;
        public List<Video> VideoList;

        public MediaPlayer()
        {
            SetVideoLabels();
            SetVideoIds();
            SetVideoList();
        }

        public bool HasVideo(Video video)
        {
            return !string.IsNullOrEmpty(video.Id);
        }

        public bool HasSingleVideo()
        {
            return VideoList.Count() > 0;
        }

        public bool HasMultipleVideos()
        {
            return VideoList.Count() > 1;
        }

        public Video GetVideoById(int id)
        {
            return VideoList.ElementAtOrDefault(id) ?? new Video();
        }

        public bool HasDuplicateVideos()
        {
            var duplicateVideoIds = GetDuplicateVideos();

            return duplicateVideoIds.Any();
        }

        public List<string> GetDuplicateVideos()
        {
            return VideoIds.GroupBy(x => x)
                .Where(group => group.Count() > 1)
                .Select(group => group.Key).ToList();
        }

        private List<string> ConvertStringToList(string entries)
        {
            return entries
                .Split(new[] { "|" }, StringSplitOptions.RemoveEmptyEntries)
                .Select(s => s.Trim()).ToList();
        }

        private List<Video> CombineListsToVideoList(List<string> firstList, List<string> secondList)
        {
            return secondList.Zip(firstList, (k, v) => new Video() { Id = k, Label = v }).ToList();
        }

        private void SetVideoList()
        {
            VideoList = CombineListsToVideoList(VideoLabels, VideoIds);
        }

        private void SetVideoLabels()
        {
            var videoLabels = SettingsManager.ContextSettings["FrameworkJS/CSS.Eflex.Play.Labels", string.Empty];

            VideoLabels = ConvertStringToList(videoLabels);
        }

        private void SetVideoIds()
        {
            var videoIds = SettingsManager.ContextSettings["FrameworkJS/CSS.Eflex.Play.Source", string.Empty];

            VideoIds = ConvertStringToList(videoIds);
        }
    }

    public class Video
    {
        public string Id { get; set; }
        public string Label { get; set; }

        public Video()
        {
            Id = string.Empty;
            Label = string.Empty;
        }
    }
}