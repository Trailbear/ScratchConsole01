// See https://aka.ms/new-console-template for more information
using Microsoft.EntityFrameworkCore;
using Test.DAL.Models;

using var db = new TestDataContext();

var tag = new Tag { TagName = "Test" };
db.Add(tag);

var post = new Post { PostName = "Test" };
db.Add(post);

post.Tags.Add(tag);
db.SaveChanges();

var posts = db.Posts
    .Include(p => p.Tags)
    .ToList();

foreach (var p in posts)
{
    Console.WriteLine($"Post: {p.PostName}, Tag Count {p.Tags.Count}");
}



