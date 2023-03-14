using Microsoft.VisualStudio.TestTools.UnitTesting;
using WpfApp2.Pages;
using System;

namespace UnitTestProjectPavelion
{
    [TestClass]
    public class UnitTest2
    {
        [TestMethod]
        public void AutoregistrationTest()
        {
            var page = new Autoregistration();
            Assert.IsTrue(page.Autoregistration("test","test"));
            Assert.IsFalse(page.Autoregistration("user1", "12345"));
            Assert.IsFalse(page.Autoregistration("", ""));
            Assert.IsFalse(page.Autoregistration(" ", " "));
        }
    }
}
